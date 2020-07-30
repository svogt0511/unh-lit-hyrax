require_dependency Zizia::Engine.config.root.join('app', 'uploaders', 'zizia', 'csv_manifest_validator.rb').to_s

class Zizia::CsvManifestValidator

    def initialize(manifest_uploader)
      @csv_file = manifest_uploader.file
      @errors = []
      @warnings = []
      @selected_files = []
    end

    # These are stored in memory only, not persisted
    def selected_files
      @selected_files ? @selected_files : []
    end

    def selected_files=(value)
      @selected_files = value
    end


	def valid_headers
		['title', 'files', 'representative media',
		 'thumbnail', 'rendering', 'depositor',
		 'date_uploaded', 'date_modified', 'label',
		 'relative_path', 'import url', 'type',
		 'creator', 'contributor', 'description',
		 'keyword', 'license', 'rights',
		 'publisher', 'created', 'subject',
		 'language', 'identifier', 'location',
		 'related url', 'bibliographic_citation',
		 'source', 'visibility', 'deduplication key', 'type',
		 'abstract', 'extent', 'spatial',
		 'alternative']
	end

	def parse_csv
    # Remove BOM chars (excel), skip blank lines, skip lines with all blank fields.
		@rows = CSV.parse(File.read(csv_file.path).sub("\xEF\xBB\xBF", ''), skip_blanks: true, skip_lines: /^(?:\s*,\s*)+$/)
		@headers = @rows.first || []
		@transformed_headers = @headers.map { |header| header.downcase.strip }
	rescue
		@errors << 'We are unable to read this CSV file.'
	end

	def required_headers
		#['title', 'creator', 'keyword', 'rights', 'visibility', 'deduplication key', 'files']
		['title', 'creator', 'rights', 'visibility', 'deduplication key', 'files']
	end

	def missing_headers
		required_headers.each do |header|
			next if @transformed_headers.include?(header) || @transformed_headers.first.to_s == header
			#@errors << "Missing required column: \"#{header.titleize}\".  Your spreadsheet must haaaaaaave thiiis column."
			@errors << "Missing required column: \"#{header}\".  Your spreadsheet must have this column."
		end
	end

	def missing_files
		validate_files('files')
	end

  # Keep this.  Not used now.  Might be needed in the future.
	def find_file_path(filename)
    filepath = Dir.glob(Zizia.config.import_path + "/**/#{filename}").first
	end

	# Make sure this column contains only valid values
	def validate_files(header_name)
		column_number = @transformed_headers.find_index(header_name)
		return unless column_number

		@rows.each_with_index do |row, i|
			next if i.zero? # Skip the header row
			next unless row[column_number]

			values = row[column_number].split(delimiter)
			#invalid_values = values.select { |value| find_file_path(value).nil? }
			invalid_values = values.select { |value|
			  found = false
			  @selected_files.each { |name, fileobj|
			    found = true if fileobj['file_name'].eql?(value)
			  }
			  !found
			}
			invalid_values.each do |value|
				@errors << "Invalid '#{header_name.titleize}' column in row #{i + 1}: #{value} not uploaded?"
			end
		end
	end


	def validate
		parse_csv
		return unless @rows

		missing_headers
		duplicate_headers
		# unrecognized_headers
		missing_values
		invalid_license
		invalid_resource_type
		invalid_rights_statement
		missing_files
	end

end
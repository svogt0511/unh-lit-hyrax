require_dependency Zizia::Engine.config.root.join('app', 'uploaders', 'zizia', 'csv_manifest_validator.rb').to_s

class Zizia::CsvManifestValidator


	def valid_headers
=begin
		['title', 'files', 'representative media',
		 'thumbnail', 'rendering', 'depositor',
		 'date_uploaded', 'date_modified', 'label',
		 'relative_path', 'import url', 'resource type',
		 'creator', 'contributor', 'description',
		 'keyword', 'license', 'rights statement',
		 'publisher', 'date created', 'subject',
		 'language', 'identifier', 'location',
		 'related url', 'bibliographic_citation',
		 'source', 'visibility', 'deduplication_key', 'type',
		 'abstract', 'extent', 'spatial coverage',
		 'alternative title']
=end
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

=begin
	def find_file_path(filename)
		filepath = Dir.glob("#{ENV['IMPORT_PATH']}/**/#{filename}").first

		#raise "Cannot find file #{filename}... Are you sure it has been uploaded and that the filename matches?" if filepath.nil?
		filepath
	end
=end

	# Make sure this column contains only valid values
	def validate_files(header_name)
		column_number = @transformed_headers.find_index(header_name)
		return unless column_number

		@rows.each_with_index do |row, i|
			next if i.zero? # Skip the header row
			next unless row[column_number]

			values = row[column_number].split(delimiter)

			#valid_values = method(valid_values_method).call
			#invalid_values = values.select { |value| !valid_values.include?(value) }
			#invalid_values = values.select { |value| find_file_path(value).nil? }
			invalid_values = values.select { |value| ::Zizia::HyraxRecordImporter::find_file_path_class(value).nil? }

			invalid_values.each do |value|
				@errors << "Invalid #{header_name.titleize} in row #{i + 1}: #{value}"
			end
		end
	end


	def validate
		parse_csv
		return unless @rows
puts "RRRRR SKV - inspect BEGIN"
puts @rows.inspect
puts "RRRRR SKV - inspect END"

		missing_headers
		duplicate_headers
		# unrecognized_headers
		missing_values
		invalid_license
		invalid_resource_type
		invalid_rights_statement
		# missing_files
	end

end
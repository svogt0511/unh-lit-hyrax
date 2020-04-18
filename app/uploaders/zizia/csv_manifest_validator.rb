require_dependency Zizia::Engine.config.root.join('app', 'uploaders', 'zizia', 'csv_manifest_validator.rb').to_s

class Zizia::CsvManifestValidator

	def valid_headers
		['title', 'files', 'representative media',
		 'thumbnail', 'rendering', 'depositor',
		 'date_uploaded', 'date_modified', 'label',
		 'relative_path', 'import url', 'resource type',
		 'creator', 'contributor', 'abstract or summary',
		 'keyword', 'license', 'rights statement',
		 'publisher', 'date created', 'subject',
		 'language', 'identifier', 'location',
		 'related url', 'bibliographic_citation',
		 'source', 'visibility', 'deduplication_key', 'type']
	end


      def required_headers
        #['title', 'creator', 'keyword', 'rights statement', 'visibility', 'files', 'deduplication_key']
        ['keyword', 'visibility', 'files', 'deduplication_key']
      end

      def missing_headers

        required_headers.each do |header|
          next if @transformed_headers.include?(header)
          @errors << "Missing required column: \"#{header.titleize}\".  Your spreadsheet must haaaaaaave thiiis column."
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
    end
end
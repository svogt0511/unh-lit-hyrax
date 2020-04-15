require_dependency Zizia::Engine.config.root.join('app', 'uploaders', 'zizia', 'csv_manifest_validator.rb').to_s

class Zizia::CsvManifestValidator

	def valid_headers
        Rails.logger.debug("AAAAA - VALIDATOR!!!")

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

      def missing_headers
                    Rails.logger.debug("CCCC - VALIDATOR!!!")

        required_headers.each do |header|
          next if @transformed_headers.include?(header)
          @errors << "Missing required column: \"#{header.titleize}\".  Your spreadsheet must haaaave this column."
        end
      end

end
require_dependency Bulkrax::Engine.config.root.join('app', 'factories', 'bulkrax', 'object_factory.rb').to_s

# frozen_string_literal: true

class Bulkrax::ObjectFactory

    # Its possible to get just an array of strings here, so we need to make sure they are all hashes
    def parsed_remote_files
        return @parsed_remote_files if @parsed_remote_files.present?
        @parsed_remote_files = attributes[:remote_files] || []
        @parsed_remote_files = @parsed_remote_files.map do |file_value|
          if file_value.is_a?(Hash)
            file_value
          elsif file_value.is_a?(String)
            # { url: file_value }
            # The file_set actor expects value hash like: { url: file_value, file_name: sfn1 }
            # One issue: here do we get a file name from?
            # It could come from the form - one file name (with erb) per url.
            # It could also be extracted by parsing the url, however, not all urls end in a file name that is
            # easily extractible. (ex: https://example.org/fedora/objects/acworth:0001/datastreams/APPLICATION-PDF/content)
            # Here we extract the file name from the remote file and sanitize it.
            f = open(file_value)
            cd = f.meta['content-disposition']
            fn = cd.match(/filename=(\"?)(.+)\1/)[2]
            sfn = ActiveStorage::Filename.new(fn).sanitized
            sfn1 = sfn.gsub(/\s/,'-')
            { url: file_value, file_name: sfn1 }
          else
            Rails.logger.error("skipped remote file #{file_value} because we do not recognize the type")
            nil
          end
        end
        @parsed_remote_files.delete(nil)
        @parsed_remote_files
    end

end
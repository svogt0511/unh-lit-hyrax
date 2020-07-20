require_dependency Zizia::Engine.config.root.join('lib', 'zizia', 'hyrax', 'hyrax_record_importer.rb').to_s

class Zizia::HyraxRecordImporter

    # The path on disk where file attachments can be found
    def file_attachments_path
      ENV['IMPORT_PATH'] || '/opt/data'
    end

    ##
    # Within the directory specified by ENV['IMPORT_PATH'], find the first
    # instance of a file matching the given filename.
    # If there is no matching file, raise an exception.
    # @param [String] filename
    # @return [String] a full pathname to the found file
    def find_file_path(filename)
      filepath = Dir.glob(file_attachments_path + "/**/#{filename}").first

      raise "Cannot find file #{filename}... Are you sure it has been uploaded and that the filename matches?" if filepath.nil?
      filepath
    end

    def self.find_file_path_class(filename)
      filepath = Dir.glob(file_attachments_path + "/**/#{filename}").first
    end

end
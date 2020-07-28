require_dependency Zizia::Engine.config.root.join('app', 'uploaders', 'zizia', 'csv_manifest_uploader.rb').to_s

class Zizia::CsvManifestUploader

    # These are stored in memory only, not persisted in the DB
    def selected_files
      @validator ? @validator.selected_files : []
    end

    def selected_files=(value)
      @validator.selected_files = value
    end

    def validate
      @validator.validate
    end

		def validate_csv
			@validator = ::Zizia::CsvManifestValidator.new(self)
		end

end


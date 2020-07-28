require_dependency Zizia::Engine.config.root.join('app', 'models', 'zizia', 'csv_import.rb').to_s

class Zizia::CsvImport

	delegate :selected_files, to: :manifest, prefix: true

	delegate :selected_files=, to: :manifest, prefix: true

	delegate :validate, to: :manifest, prefix: true

end

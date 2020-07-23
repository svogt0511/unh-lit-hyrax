Zizia.config do |config|
  config.metadata_mapper_class = CustomMapper
  config.import_path = ENV['IMPORT_PATH'] || '/opt/data'
end
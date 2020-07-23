# Don't know if this is the place to put it, but we need to extend the Zizia Configuration class to add Zizia.config.import_path.
# This works.  Will change it when we find a better solution.  I am sure there is one out there.

Zizia::Configuration.class_eval do

	attr_accessor :import_path

	# This class has already been created and initialize has has been called.
	# We will just set the default import_path here.
  @import_path = '/opt/data'

end

Zizia.config do |config|

  # Set up for using our own custom mapper.
  config.metadata_mapper_class = CustomMapper

  # Bring in the IMPORT_PATH environment variable if it has been set.
  config.import_path = ENV['IMPORT_PATH'] || '/opt/data'

end
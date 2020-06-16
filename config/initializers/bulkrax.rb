# frozen_string_literal: true

Bulkrax.setup do |config|
  # Add local parsers
  # config.parsers += [
  #   { name: 'MODS - My Local MODS parser', class_name: 'Bulkrax::ModsXmlParser', partial: 'mods_fields' },
  # ]

  # Field to use during import to identify if the Work or Collection already exists.
  # Default is 'source'.
  # config.system_identifier_field = 'source'
  config.system_identifier_field = 'identifier'

  # WorkType to use as the default if none is specified in the import
  # Default is the first returned by Hyrax.config.curation_concerns
  # config.default_work_type = MyWork
  config.default_work_type = 'Work'

  # Path to store pending imports
  # config.import_path = 'tmp/imports'

  # Path to store exports before download
  # config.export_path = 'tmp/exports'

  # Server name for oai request header
  # config.server_name = 'my_server@name.com'

  # Field_mapping for establishing the source_identifier
  # This value IS NOT used for OAI, so setting the OAI Entries here will have no effect
  # The mapping is supplied per Entry, provide the full class name as a string, eg. 'Bulkrax::CsvEntry'
  # Example:
  #   {
  #     'Bulkrax::RdfEntry'  => 'http://opaquenamespace.org/ns/identifier',
  #     'Bulkrax::CsvEntry'  => 'MyIdentifierField'
  #   }
  # The default value for CSV is 'source_identifier'
  # config.source_identifier_field_mapping = { }
  config.source_identifier_field_mapping = {
	# 'Bulkrax::CsvEntry'  => 'source_identifier'
	'Bulkrax::CsvEntry'  => 'identifier'
  }

  # Field_mapping for establishing a parent-child relationship (FROM parent TO child)
  # This can be a Collection to Work, or Work to Work relationship
  # This value IS NOT used for OAI, so setting the OAI Entries here will have no effect
  # The mapping is supplied per Entry, provide the full class name as a string, eg. 'Bulkrax::CsvEntry'
  # Example:
  #   {
  #     'Bulkrax::RdfEntry'  => 'http://opaquenamespace.org/ns/contents',
  #     'Bulkrax::CsvEntry'  => 'children'
  #   }
  # By default no parent-child relationships are added
  # config.parent_child_field_mapping = { }

  # Use a column called 'children'
  #config.parent_child_field_mapping = {
  #  'Bulkrax::CsvEntry' => 'children'
  #}

  # Field_mapping for establishing a collection relationship (FROM work TO collection)
  # This value IS NOT used for OAI, so setting the OAI parser here will have no effect
  # The mapping is supplied per Entry, provide the full class name as a string, eg. 'Bulkrax::CsvEntry'
  # The default value for CSV is collection
  # Add/replace parsers, for example:
  # config.collection_field_mapping['Bulkrax::RdfEntry'] = 'http://opaquenamespace.org/ns/set'

  # Change the collection_field_mapping to use a column called 'primary_collection'
  config.collection_field_mapping = {
  #  'Bulkrax::CsvEntry' => 'collection'
    'Bulkrax::CsvEntry' => 'collection'
  }

  # Field mappings
  # Create a completely new set of mappings by replacing the whole set as follows
  #   config.field_mappings = {
  #     "Bulkrax::OaiDcParser" => { **individual field mappings go here*** }
  #   }

  # Field mappings
  # Create a completely new set of mappings by replacing the whole set as follows
  config.field_mappings = {
     "Bulkrax::CsvParser" => {
       "abstract" => { from: ["abstract"], split: /\|~\|/ },
       # "alternative_title" => { from: ["alternative"] },
       # "bibliographic_citation" => { from: ["bibliographicCitation"] },
       # "collection" => { from: ["collection"] },
       # "contributor" => { from: ["contributor"] },
       "creator" => { from: ["creator"], split: /\|~\|/ },
       "date_created" => { from: ["created"], split: /\|~\|/ },
       "description" => { from: ["description"], split: /\|~\|/ },
       "extent" => { from: ["extent"], split: /\|~\|/ },
       "identifier" => { from: ["identifier"] },
       "keyword" => { from: ["keyword"], split: /\|~\|/ },
       "language" => { from: ["language"], split: /\|~\|/ },
       # "license" => { from: ["license"] },
       "publisher" => { from: ["publisher"], split: /\|~\|/ },
       "related_url" => { from: ["relation"], split: /\|~\|/ },
       # "remote_files" => { from: ["thumbnail_url"], parsed: true }
       # "rights_holder" => { from: ["rightsHolder"] },
       "resource_type" => { from: ["type"], split: /\|~\|/ },
       "rights_statement" => { from: ["rights"] },
       "source" => { from: ["source"], split: /\|~\|/ },
       "spatial_coverage" => { from: ["spatial"], split: /\|~\|/ },
       "subject" => { from: ["subject"], split: /\|~\|/ },
       "title" => { from: ["title"], split: /\|~\|/ },
       "visibility" => { from: ["visibility"], split: /\|~\|/ },

	   ### SHOULD BE CONTROLLED VOCABS - PARSEDF
       # "language" => { from: ["language"], split: /\|~\|/ },
       # "resource_type" => { from: ["type"], parsed: true },
       # "subject" => { from: ["subject"], parsed: true },
       "remote_files" => { from: ["thumbnail_url"], parsed: true }
     }
  }

# Check into 'parse' method. - Currently not used.
def parse_resource_type
    'Aerial Photographs'
end

# Check into 'parse' method. - Currently not used.
def parse_subject
    'Aerial Photographs'
end

  # Add to, or change existing mappings as follows
  #   e.g. to exclude date
  #   config.field_mappings["Bulkrax::OaiDcParser"]["date"] = { from: ["date"], excluded: true  }

  # To duplicate a set of mappings from one parser to another
  #   config.field_mappings["Bulkrax::OaiOmekaParser"] = {}
  #   config.field_mappings["Bulkrax::OaiDcParser"].each {|key,value| config.field_mappings["Bulkrax::OaiOmekaParser"][key] = value }

  # Properties that should not be used in imports/exports. They are reserved for use by Hyrax.
  # config.reserved_properties += ['my_field']
end

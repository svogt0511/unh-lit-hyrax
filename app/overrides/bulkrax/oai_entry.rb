require_dependency Bulkrax::Engine.config.root.join('app', 'models', 'bulkrax', 'oai_entry.rb').to_s

# frozen_string_literal: true

class Bulkrax::OaiEntry

    def build_metadata
      self.parsed_metadata = {}
      self.parsed_metadata[Bulkrax.system_identifier_field] = [record.header.identifier]

      record.metadata.children.each do |child|
        child.children.each do |node|
          add_metadata(node.name, node.content)
        end
      end
      # add_metadata('thumbnail_url', thumbnail_url)
      add_metadata('remote_files', thumbnail_url)

      add_visibility
      add_rights_statement
      add_collections
      add_local

      return self.parsed_metadata
    end

end
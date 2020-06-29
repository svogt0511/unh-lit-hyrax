require_dependency Bulkrax::Engine.config.root.join('app', 'parsers', 'bulkrax', 'oai_dc_parser.rb').to_s

# frozen_string_literal: true

module Bulkrax
  class OaiDcParser

    def create_works
      results = self.records(quick: true)
      return unless results.present?
      results.full.each_with_index do |record, index|
        break if limit_reached?(limit, index)
        if record.deleted? # TODO: record.status == "deleted"
          importerexporter.current_importer_run.deleted_records += 1
          importerexporter.current_importer_run.save!
        else
#
# CODE BLOCK 1
#

#=begin
          seen[record.identifier] = true
          new_entry = entry_class.where(importerexporter: self.importerexporter, identifier: record.identifier).first_or_create!
          ImportWorkJob.send(perform_method, new_entry.id, importerexporter.current_importer_run.id)
          increment_counters(index)
#=end

# Use either code block 1 or code block 2, not both.
# Eventually, direction for this should come from the importer form.  We should customize the importer form for this.
# Needs work. Counters are off and we need to verify it is doing everything it should.
#
# CODE BLOCK 2
#

=begin
#if record.identifier.end_with?("yearbook:1909")
#if record.identifier.end_with?("acworth:0001")
#if record.identifier.end_with?("acworth:0005")
puts "JJJJJ 2 - CREATE WORKS - FOUND THE RECORD!"
puts record.identifier.inspect
          seen[record.identifier] = true
          new_entry = entry_class.where(importerexporter: self.importerexporter, identifier: record.identifier).first_or_create!
          ImportWorkJob.send(perform_method, new_entry.id, importerexporter.current_importer_run.id)
          increment_counters(index)
else
puts "JJJJJ 2 - CREATE WORKS - DID NOT NOT NOT FIND THE RECORD!"
puts record.identifier.inspect
end
=end


        end
      end
    end

  end
end

# Generated via
#  `rails generate hyrax:work Work`
class Work < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = WorkIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }
  validates :creator, presence: { message: 'Your work must have a creator.' }
  validates :rights_statement, presence: { message: 'Your work must have a rights statement.' }

  property :spatial, predicate: ::RDF::Vocab::DC.spatial, multiple: true do |index|
    index.as :stored_searchable
  end

  property :extent, predicate: ::RDF::Vocab::DC.extent,  multiple: true do |index|
    index.as :stored_searchable
  end

  property :deduplication_key, predicate: ::RDF::Vocab::BF2::identifiedBy, multiple: false do |index|
    index.as :stored_searchable
  end

  # Override hyrax-3.0.0.pre.rc1/app/models/concerns/hyrax/basic_metadata.rb to make sure this is a multi-valued field.
  property :alt_title, predicate: ::RDF::Vocab::DC.alternative, multiple: true do |index|
    index.as :stored_searchable
  end

  property :medium, predicate: ::RDF::Vocab::DC.medium, multiple: true do |index|
    index.as :stored_searchable
  end

  property :format, predicate: ::RDF::Vocab::DC.format, multiple: false do |index|
    index.as :stored_searchable, :facetable
  end

##### Sample Code: BEGIN ####
#  before_save :whatever sample method for setting RDF::Literal data types.

  def whatever
 puts "CCCCCC - WHATEVER! START"
 puts self.inspect
 puts "CCCCCC - WHATEVER! MIDDLE"
 puts self.date_created
 	self.date_created = [ ::RDF::Literal.new("2009-12-31", datatype: ::RDF::URI('http://purl.org/dc/terms/W3CDTF')) ]
 puts self.inspect
 puts "CCCCCC - WHATEVER! END"
  end

##### Sample Code: END ####

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end

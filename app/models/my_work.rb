# Generated via
#  `rails generate hyrax:work MyWork`
class MyWork < ActiveFedora::Base
  include ::Hyrax::WorkBehavior

  self.indexer = MyWorkIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  property :deduplication_key, predicate: "http://curationexperts.com/vocab/predicates#deduplicationKey", multiple: false do |index|
    index.as :stored_searchable
  end

  # This must be included at the end, because it finalizes the metadata
  # schema (by adding accepts_nested_attributes)
  include ::Hyrax::BasicMetadata
end

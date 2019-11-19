# Generated via
#  `rails generate hyrax:work GenericWork`
module Hyrax
  class GenericWorkPresenter < Hyrax::WorkShowPresenter
    delegate :contact_email, :contact_phone, :spatial_coverage, to: :solr_document
    #delegate :contact_email, :contact_phone, to: :solr_document
  end
end

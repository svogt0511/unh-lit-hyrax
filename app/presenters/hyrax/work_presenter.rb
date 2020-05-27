# Generated via
#  `rails generate hyrax:work Work`
module Hyrax
  class WorkPresenter < Hyrax::WorkShowPresenter
    delegate :spatial_coverage, :extent, :bibliographic_citation, :medium, to: :solr_document
  end
end

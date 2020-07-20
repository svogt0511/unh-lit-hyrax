# Generated via
#  `rails generate hyrax:work Work`
module Hyrax
  class WorkPresenter < Hyrax::WorkShowPresenter
    delegate :bibliographic_citation, :extent, :format, :medium, :provenance, :spatial, :temporal, to: :solr_document
  end
end

# Generated via
#  `rails generate hyrax:work Work`
module Hyrax
  class WorkPresenter < Hyrax::WorkShowPresenter
    delegate :spatial, :extent, :bibliographic_citation, :medium, :format, to: :solr_document
  end
end

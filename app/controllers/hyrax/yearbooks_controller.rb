# Generated via
#  `rails generate hyrax:work Yearbook`
module Hyrax
  # Generated controller for Yearbook
  class YearbooksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Yearbook

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::YearbookPresenter
  end
end

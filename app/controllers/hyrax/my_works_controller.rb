# Generated via
#  `rails generate hyrax:work MyWork`
module Hyrax
  # Generated controller for MyWork
  class MyWorksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::MyWork

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::MyWorkPresenter
  end
end

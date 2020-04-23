# Generated via
#  `rails generate hyrax:work TownReport`
module Hyrax
  # Generated controller for TownReport
  class TownReportsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::TownReport

    # Use this line if you want to use a custom presenter
    self.show_presenter = Hyrax::TownReportPresenter
  end
end

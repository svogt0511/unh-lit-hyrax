class ApplicationController < ActionController::Base
  helper Openseadragon::OpenseadragonHelper
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  skip_after_action :discard_flash_if_xhr
  include Hydra::Controller::ControllerBehavior

  # Adds Hyrax behaviors into the application controller
  include Hyrax::Controller
  include Hyrax::ThemedLayoutController
  with_themed_layout '1_column'

  helper Zizia::Engine.helpers

  #protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
end

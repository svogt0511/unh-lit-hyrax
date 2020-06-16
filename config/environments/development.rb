Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

#Rails.logger = Logger.new(STDOUT)
#config.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
#Rails.logger.info "SKV2000 - Check out this info!"


  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.assets.digest = false

  # Suppress logger output for asset requests.
  config.assets.quiet = true


#config.assets.configure do |env|
#  env.cache = ActiveSupport::Cache.lookup_store(:null_store)
#end

  # config.assets.prefix = "/dev-assets"

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.default_options = { from: "noreply@unh.edu" }

  config.log_level = :debug

  # Force_ssl causes 'too many redirects' - infinite redirect loop.
  #config.force_ssl = true
  config.force_ssl = false

  # Action_cable is for notifications.
  config.action_cable.allowed_request_origins = [/http:\/\/*/, /https:\/\/*/]
  # config.action_cable.url = [/ws:\/\/*/, /wss:\/\/*/]
  config.action_cable.url = "ws://localhost:3000/notifications"
  # config.action_cable.disable_request_forgery_protection = true

  # config.action_mailer.default_url_options = { host: ENV.fetch("APPLICATION_HOST", "localhost"), protocol: ENV.fetch("APPLICATION_HOST_PROTOCOL", "http") }

  config.action_mailer.default_url_options = { host: ENV.fetch("APPLICATION_HOST", "digitalcollections-test.unh.edu"), protocol: ENV.fetch("APPLICATION_HOST_PROTOCOL", "https") }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true

  # Allow public directory direct access through browser?
  config.public_file_server.enabled = true

end

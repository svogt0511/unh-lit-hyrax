require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyApp
  class Application < Rails::Application
    require 'zizia'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.to_prepare do
      Dir.glob(Rails.root + "app/overrides/**/*.rb").each do |c|
        require_dependency(c)
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Use config/local_env.yml to set environment variables for configuragion.
    config.before_configuration do
	  env_file = File.join(Rails.root, 'config', 'local_env.yml')
	  YAML.load(File.open(env_file)).each do |key, value|
	    ENV[key.to_s] = value
	  end if File.exists?(env_file)
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # rails time:zones

    config.time_zone = "Eastern Time (US & Canada)"


  end
end

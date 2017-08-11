require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QLDAServer
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("vendor", "assets", "bower_components")
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Hanoi"
    config.active_record.default_timezone = :local
    config.assets.initialize_on_precompile = false
    config.to_prepare do
      Devise::SessionsController.layout "login"
    end
  end
end

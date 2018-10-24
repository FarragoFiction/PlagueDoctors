require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlagueDoctor
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #

    # in config/application.rb
    config.action_dispatch.default_headers = {
        'Access-Control-Allow-Origin' => 'http://www.farragofiction.com',
        'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    }

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

  end
end

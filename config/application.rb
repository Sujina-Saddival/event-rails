require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EventRails
	class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, "Rack::Cors" do
    	allow do
        # origins '*'
        # resource '/api/v1/*', :headers => :any, :methods => [:get, :post, :options]
        # origins(/http:\/\/localhost:(\d*)/)
        #   /^(http|https):\/\/.*\.hawa\.qwinix\.io/
        #   )
        origins '*'
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :delete, :options, :head]
      end
    end
    config.active_record.raise_in_transactional_callbacks = true

  end
end

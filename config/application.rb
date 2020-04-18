require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MoneyTrailApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # https://edgeguides.rubyonrails.org/api_app.html#using-session-middlewares
    # https://stackoverflow.com/questions/15342710/adding-cookie-session-store-back-to-rails-api-app
    # https://medium.com/@kevin.ngao/hi-i-was-reading-over-your-tutorial-and-found-out-that-it-didnt-work-for-me-the-cookies-were-9b5626e2304d#--responses
    # Cookies won't work when generating an API-only project, so we have to add that functionality back in.
    config.session_store :cookie_store, key: '_money_trail'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
  end
end

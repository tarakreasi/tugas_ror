require_relative 'boot'
require 'logger'

require 'rails/all'
require 'yaml'
module Psych
  class << self
    alias_method :orig_safe_load, :safe_load
    def safe_load(yaml, *args, **kwargs)
      kwargs[:aliases] = true if kwargs.respond_to?(:key?) && !kwargs.key?(:aliases)
      kwargs[:permitted_classes] = (kwargs[:permitted_classes] || []) + [Symbol, Time, Date, DateTime, ActiveSupport::HashWithIndifferentAccess]
      orig_safe_load(yaml, *args, **kwargs)
    end
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KampusRor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

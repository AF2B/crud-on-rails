require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)
module CrudOnRails
  class Application < Rails::Application
    config.load_defaults 6.1

    config.api_only = true

    EmailVerifier.config do |config|
      config.verifier_email = 'realname@realdomain.com'
    end
  end
end


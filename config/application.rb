require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WeixinBotWebui
  class Application < Rails::Application
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file))[Rails.env].to_h.each do |key, value|
        ENV[key.to_s] = value.to_s
      end if env_file.present?
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Beijing'
    config.i18n.default_locale = :'zh-CN'
    config.i18n.available_locales = [:'zh-CN', :'en']

    config.generators do |g|
      g.orm :active_record
      g.template_engine :erb
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework ""
    end
  end
end

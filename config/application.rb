require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module TutuExample
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/app/models/wagons)
    config.active_record.raise_in_transactional_callbacks = true
    config.i18n.default_locale = :ru
  end
end

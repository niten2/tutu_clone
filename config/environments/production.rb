Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { host: "http://tutu-clone-thinknetica.herokuapp.com" }

  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
        api_key: 'key-0dd1bd1b02b92b18e0d59bf65d15c368',
        domain: 'sandboxba9ebe7e1b814161a96b58e1c731e2b7.mailgun.org'
        }
end

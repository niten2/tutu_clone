Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :letter_opener
  # config.action_mailer.delivery_method = :mailgun
  # config.action_mailer.mailgun_settings = {
  #       api_key: 'key-0dd1bd1b02b92b18e0d59bf65d15c368',
  #       domain: 'sandboxba9ebe7e1b814161a96b58e1c731e2b7.mailgun.org'
  #       }
end

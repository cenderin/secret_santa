Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { host: ENV['HEROKU_DOMAIN'] }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    user_name:            Rails.application.secrets.mandrill_username,
    password:             Rails.application.secrets.mandrill_apikey,
    domain:               ENV['HEROKU_DOMAIN'],
    address:              'smtp.mandrillapp.com',
    port:                 587,
    authentication:       :plain,
    enable_starttls_auto: true
  }
end

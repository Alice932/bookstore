# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'

  config.omniauth :google_oauth2, Rails.application.credentials.google_oauth_client_id, Rails.application.credentials.google_oauth_client_secret, { provider_ignores_state: true }
  OmniAuth.config.allowed_request_methods = %i[get]
  config.mailer_sender = 'aliceway932@gmail.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128
  config.reset_password_within = 6.hours

  config.navigational_formats = ['*/*', :html, :turbo_stream]
  config.sign_out_via = :get
end

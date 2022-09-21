# frozen_string_literal: true

ActiveAdmin.setup do |config|
  config.site_title = 'Bookstore'
  config.display_name_methods = %i[first_name last_name]
  config.comments = false
  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.batch_actions = true

  config.filter_attributes = %i[encrypted_password password password_confirmation]
  config.localize_format = :long
end

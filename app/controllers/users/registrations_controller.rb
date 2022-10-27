# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def update_resource(resource, params)
      if resource.provider == 'google_oauth2'
        params.delete('current_password')
        resource.password = params['password']
        resource.update_without_password(params)
      else
        resource.update_with_password(params)
      end
    end

    def create
      if params[:user][:quick].present?
        quick_registration
      else
        super
      end
    end

    private

    def quick_registration
      user_create
      if resource.save
        authenticate_user
      else
        redirect_to cart_path, alert: resource.errors.full_messages.to_sentence
      end
    end

    def devise_password
      Devise.friendly_token[1, 8]
    end

    def user_create
      params[:user][:password] = params[:user][:password_confirmation] = devise_password
      build_resource(sign_up_params)
      resource.skip_confirmation!
    end

    def authenticate_user
      sign_up(resource_name, resource)
      resource.send_reset_password_instructions
      redirect_to(checkout_path, notice: t('devise.quick_registration.send_password_instructions'))
    end
  end
end

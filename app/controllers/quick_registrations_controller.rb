# frozen_string_literal: true

class QuickRegistrationsController < ApplicationController
  def show; end

  def create
    if QuickRegisterService.new(params).user_create
      @resource = User.find_by(email: params[:user][:email])
      authenticate_user
    else
      redirect_to cart_path, alert: t('devise.quick_registration.error')
    end
  end

  private

  def authenticate_user
    sign_in(@resource)
    @resource.send_reset_password_instructions
    redirect_to checkout_path, notice: t('devise.quick_registration.send_password_instructions')
  end
end

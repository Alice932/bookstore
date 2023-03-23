# frozen_string_literal: true

class QuickRegisterService
  attr_accessor :user

  def initialize(params)
    @params = params
  end

  def user_create
    @params[:user][:password] = @params[:user][:password_confirmation] = Devise.friendly_token
    @resource = User.new(sign_up_params)
    resource.skip_confirmation!
    resource.save
  end

  def sign_up_params
    @params[:user].permit(:email, :password, :password_confirmation)
  end

  def resource
    @resource ||= User.new
  end
end

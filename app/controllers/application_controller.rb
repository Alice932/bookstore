# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart, :cart_count

  def current_cart
    @current_cart ||= CurrentCart.new(current_user, cookies).call
  end

  def cart_count
    @cart_count ||= current_cart ? current_cart.cart_items.sum(:quantity) : Constants::Cart::NULL_COUNT
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart, :order_count

  def current_cart
    @current_cart ||= CurrentOrder.new(current_user, cookies).call
  end

  def order_count
    @order_count ||= current_cart ? current_cart.order_items.sum(:quantity) : Constants::Order::NULL_COUNT
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

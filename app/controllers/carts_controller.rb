# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @current_cart = current_cart.decorate
    @user_checkout_path = current_user.nil? ? quick_registration_path : checkout_path
  end
end

# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    @state = current_cart.state
    @current_cart = decorate_current_cart
  end

  def update
    @service = checkout_service
    @current_cart = decorate_current_cart
    @state = current_cart.state
    if current_cart.complete?
      redirect_to checkout_path, status: :see_other
    else
      render :show
    end
  end

  private

  def decorate_current_cart
    current_cart.decorate
  end

  def checkout_service
    @checkout_service ||= CheckoutService.new(current_user, current_cart, params).call
  end
end

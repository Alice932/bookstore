# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :update_cart_price, only: [:show]

  def show
    @current_cart = current_cart.decorate
  end

  private

  def update_cart_price
    current_cart.update(total: current_cart.decorate.total_price)
  end
end

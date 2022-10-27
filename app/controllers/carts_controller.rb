# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @current_cart = current_cart.decorate
    current_cart.update(total: @current_cart.total_price)
  end
end

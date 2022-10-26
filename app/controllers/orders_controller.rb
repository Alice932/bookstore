# frozen_string_literal: true

class OrdersController < ApplicationController
  def show
    @current_cart = current_cart.decorate
    Order.find_by(id: current_cart.id).update(total_price: @current_cart.total_price)
  end
end

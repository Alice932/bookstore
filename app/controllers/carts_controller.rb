# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @current_cart = current_cart.decorate
  end
end

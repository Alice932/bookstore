# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @current_cart = current_cart.decorate
    @total = @current_cart.cart_books.includes([:book]).map do |cart_book|
      cart_book.book.price * cart_book.quantity
    end.sum
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart, :cart_count

  def current_cart
    @current_cart ||= CartService.new(current_user, cookies).check_cart
  end

  def cart_count
    @cart_count ||= current_cart ? current_cart.cart_books.sum(:quantity) : '0'
  end
end

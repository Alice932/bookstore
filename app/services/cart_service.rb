# frozen_string_literal: true

class CartService
  attr_accessor :cookies
  attr_reader :user

  def initialize(user, cookies)
    @user = user
    @cookies = cookies
  end

  def check_cart
    if cart_exist?
      user_id_set(user)
    elsif user && user.cart.present?
      Cart.find(user.cart.id)
    else
      create_cart(user&.id)
    end
  end

  private

  def user_id_set(user)
    if user
      cart_from_cookies[:user_id] = user.id
      cart_from_cookies.save
    end
    cart_from_cookies
  end

  def create_cart(user_id)
    cart = Cart.create(user_id:)
    cookies[:cart_id] = cart.id unless user_id
    cart
  end

  def cart_exist?
    @cart_exist ||= Cart.where(id: cookies[:cart_id]).present?
  end

  def cart_from_cookies
    @cart_from_cookies ||= Cart.find(cookies[:cart_id])
  end
end

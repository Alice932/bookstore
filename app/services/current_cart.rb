# frozen_string_literal: true

class CurrentCart
  def call
    if cart_exist?
      user_id_set(user)
    elsif user_exist?
      cart_from_user(user)
    else
      create_cart(user&.id)
    end
  end

  private

  attr_accessor :cookies
  attr_reader :user

  def initialize(user, cookies)
    @user = user
    @cookies = cookies
  end

  def user_id_set(user)
    cart_from_cookies.update(user_id: user.id) if user
    cart_from_cookies
  end

  def create_cart(user_id)
    cart = Cart.create(user_id:)
    cookies[:cart_id] = cart.id unless user_id
    cart
  end

  def user_exist?
    user&.cart.present?
  end

  def cart_exist?
    Cart.exists?(id: cookies[:cart_id])
  end

  def cart_from_user(user)
    Cart.find_by(id: user.cart.id)
  end

  def cart_from_cookies
    @cart_from_cookies ||= Cart.find_by(id: cookies[:cart_id])
  end
end

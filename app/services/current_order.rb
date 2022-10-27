# frozen_string_literal: true

class CurrentOrder
  def call
    if order_exist?
      user_id_set(user)
    elsif user_exist?
      order_from_user(user)
    else
      create_order(user&.id)
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
    order_from_cookies.update(user_id: user.id) if user
    order_from_cookies
  end

  def create_order(user_id)
    order = Order.create(user_id:)
    cookies[:order_id] = order.id unless user_id
    order
  end

  def user_exist?
    user&.order.present?
  end

  def order_exist?
    Order.exists?(id: cookies[:order_id])
  end

  def order_from_user(user)
    Order.find_by(id: user.order.id)
  end

  def order_from_cookies
    @order_from_cookies ||= Order.in_processing.find_by(id: cookies[:order_id])
  end
end
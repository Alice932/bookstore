# frozen_string_literal: true

class OrderDecorator < Draper::Decorator
  delegate_all
  decorates_association :order_item
  def subtotal_price
    order_items.includes([:book]).sum { |item| item.quantity * item.book.price }
  end

  def discount
    coupon ? subtotal_price * coupon.discount / Constants::Coupon::MAX_DISCOUNT : Constants::Coupon::MIN_DISCOUNT
  end

  def total_price
    subtotal_price - discount
  end
end

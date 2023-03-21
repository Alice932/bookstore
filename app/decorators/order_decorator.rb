# frozen_string_literal: true

class OrderDecorator < Draper::Decorator
  delegate_all
  decorates_association :order_item
  def subtotal_price
    order_items.includes([:course]).sum { |item| item.quantity * item.course.price }
  end

  def delivery_price
    delivery ? delivery.price : 0
  end

  def discount
    coupon ? subtotal_price * coupon.discount / Constants::Coupon::MAX_DISCOUNT : Constants::Coupon::MIN_DISCOUNT
  end

  def total_price
    subtotal_price + delivery_price - discount
  end
end

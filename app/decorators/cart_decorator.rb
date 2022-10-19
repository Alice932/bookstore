# frozen_string_literal: true

class CartDecorator < Draper::Decorator
  delegate_all
  decorates_association :cart_book
  def subtotal_price
    cart_books.sum { |item| item.quantity * item.book.price }
  end

  def discount
    coupon ? subtotal_price * coupon.discount / Constants::Coupon::MAX_DISCOUNT : Constants::Coupon::MIN_DISCOUNT
  end

  def total_price
    subtotal_price - discount
  end
end

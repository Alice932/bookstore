# frozen_string_literal: true

class OrderItemDecorator < Draper::Decorator
  delegate_all
  delegate :price, to: :course, prefix: true

  def subtotal_price
    quantity * course_price
  end
end

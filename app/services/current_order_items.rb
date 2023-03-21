# frozen_string_literal: true

class CurrentOrderItems
  attr_reader :order, :params

  def initialize(order:, params:)
    @order = order
    @params = params
  end

  def call
    order_item ? update_order_item : create_order_item
  end

  private

  def order_item
    @order_item ||= order.order_items.find_by(course: params[:course_id])
  end

  def order_item_quantity
    order_item.quantity += params[:quantity].to_i
  end

  def more_courses?
    order_item_quantity > order_item.quantity
  end

  def update_order_item
    return if more_courses?

    order_item.quantity < Constants::Order::QUANTITY_INCREMENT ? order_item.delete : order_item.save
  end

  def create_order_item
    order.order_items.create(params)
  end
end

# frozen_string_literal: true

class CurrentOrderItems
  def call
    order_item ? update_order_item : create_order_item
  end

  private

  attr_reader :order, :params

  def initialize(order:, params:)
    @order = order
    @params = params
  end

  def order_item
    @order_item ||= order.order_items.find_by(book: params[:book_id])
  end

  def order_item_quantity
    order_item.quantity += params[:quantity].to_i
  end

  def more_books?
    order_item_quantity > order_item.quantity
  end

  def update_order_item
    return if more_books?

    order_item.quantity < Constants::Order::QUANTITY_INCREMENT ? order_item.delete : order_item.save
  end

  def create_order_item
    order.order_items.create(params)
  end
end

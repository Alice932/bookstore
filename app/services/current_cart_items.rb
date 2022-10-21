# frozen_string_literal: true

class CurrentCartItems
  def call
    cart_item ? update_cart_item : create_cart_item
  end

  private

  attr_reader :cart, :params

  def initialize(cart:, params:)
    @cart = cart
    @params = params
  end

  def cart_item
    @cart_item ||= cart.cart_items.find_by(book: params[:book_id])
  end

  def cart_item_quantity
    cart_item.quantity += params[:quantity].to_i
  end

  def more_books?
    cart_item_quantity > cart_item.quantity
  end

  def update_cart_item
    return if more_books?

    cart_item.quantity < Constants::Cart::QUANTITY_INCREMENT ? cart_item.delete : cart_item.save
  end

  def create_cart_item
    cart.cart_items.create(params)
  end
end

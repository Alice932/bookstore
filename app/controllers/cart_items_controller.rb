# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :book_quantity, only: [:update], unless: :create_user_cart

  def create
    return redirect_to(cart_path, alert: t('cart.alert')) if cart_item_exist?

    create_user_cart
    redirect_to cart_path, notice: t('cart.notice')
  end

  def update
    redirect_to cart_path, notice: t('cart.updated')
  end

  def destroy
    CartItem.find_by(id: params[:id])&.destroy
    redirect_to cart_path, notice: t('cart.deleted')
  end

  private

  def book_quantity
    redirect_to cart_path
  end

  def create_user_cart
    @create_user_cart ||= CurrentCartItems.new(cart: current_cart, params: cart_items_params).call
  end

  def cart_item_exist?
    @cart_item_exist ||= current_cart.cart_items.find_by(book_id: cart_items_params[:book_id]).present?
  end

  def cart_items_params
    params.require(:cart_item).permit(:book_id, :quantity)
  end
end

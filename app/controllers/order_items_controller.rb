# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :book_quantity, only: [:update], unless: :create_user_order

  def create
    return redirect_to(cart_path, alert: t('order.alert')) if order_item_exist?

    create_user_order
    redirect_to cart_path, notice: t('order.notice')
  end

  def update
    redirect_to cart_path, notice: t('order.updated')
  end

  def destroy
    OrderItem.find_by(id: params[:id])&.destroy
    redirect_to cart_path, notice: t('order.deleted')
  end

  private

  def book_quantity
    redirect_to cart_path
  end

  def create_user_order
    @create_user_order ||= CurrentOrderItems.new(order: current_cart, params: order_items_params).call
  end

  def order_item_exist?
    @order_item_exist ||= current_cart.order_items.find_by(book_id: order_items_params[:book_id]).present?
  end

  def order_items_params
    params.require(:order_item).permit(:book_id, :quantity)
  end
end

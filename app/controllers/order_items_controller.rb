# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :course_quantity, only: [:update]

  def create
    return redirect_to(cart_path, alert: t('order.alert')) if order_item_exist?

    CurrentOrderItems.new(order: current_cart, params: order_items_params).call
    redirect_to cart_path, notice: t('order.notice')
  end

  def update
    redirect_to cart_path, status: :see_other, notice: t('order.updated')
  end

  def destroy
    item_to_delete = OrderItem.find_by(id: params[:id])
    redirect_to cart_path, notice: t('order.deleted') if item_to_delete.destroy
  end

  private

  def course_quantity
    CurrentOrderItems.new(order: current_cart, params: order_items_params).call
  end

  def order_item_exist?
    @order_item_exist ||= current_cart.order_items.find_by(course_id: order_items_params[:course_id]).present?
  end

  def order_items_params
    params.require(:order_item).permit(:course_id, :quantity)
  end
end

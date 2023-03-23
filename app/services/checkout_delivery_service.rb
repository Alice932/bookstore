# frozen_string_literal: true

class CheckoutDeliveryService < CheckoutApplicationService
  attr_reader :user, :order, :params

  def call
    update_order
    order.set_payment! if order.delivery_id
  end

  private

  def update_order
    order.update(delivery_id: params[:delivery_id])
  end
end

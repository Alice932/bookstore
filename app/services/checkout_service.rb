# frozen_string_literal: true

class CheckoutService < CheckoutApplicationService
  attr_reader :user, :order, :params

  CHECKOUT_SERVICES = { address: CheckoutAddressService,
                        delivery: CheckoutDeliveryService,
                        payment: CheckoutPaymentService,
                        confirm: CheckoutConfirmService }.freeze

  def call
    return if order.aasm.current_state == :complete

    call_service
  end

  private

  def call_service
    @call_service ||= CHECKOUT_SERVICES[order.aasm.current_state].new(user, order, params).call
  end
end

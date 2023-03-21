# frozen_string_literal: true

class CheckoutAddressService < CheckoutApplicationService
  attr_reader :user, :order, :params

  BILLING = :billing
  SHIPPING = :shipping

  def call
    order.set_delivery! if billing_address_form.save && shipping_address_form.save
    send_forms
  end

  private

  def send_forms
    { billing: billing_address_form, shipping: shipping_address_form }
  end

  def billing_address_form
    @billing_address_form ||= AddressForm.new(address(BILLING), addres_params[BILLING])
  end

  def shipping_address_form
    return @shipping_address_form ||= AddressForm.new(address(SHIPPING), params_for_billing) if use_billing?

    @shipping_address_form ||= AddressForm.new(address(SHIPPING), addres_params[SHIPPING])
  end

  def address(type)
    Address.find_or_initialize_by(user:, type: addres_params[type][:type])
  end

  def use_billing?
    params[:address][:use_billing] == 'true'
  end

  def addres_params
    params.require(:address).permit(:use_billing,
                                    BILLING => %i[first_name last_name address city country zip phone type],
                                    SHIPPING => %i[first_name last_name address city country zip phone type])
  end

  def params_for_billing
    params_for_shipping = addres_params[BILLING]
    params_for_shipping[:type] = ShippingAddress.name
    params_for_shipping
  end
end

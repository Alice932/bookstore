# frozen_string_literal: true

class CheckoutApplicationService
  def initialize(current_user, current_cart, params)
    @user = current_user
    @order = current_cart
    @params = params
  end
end

# frozen_string_literal: true

class CouponsController < ApplicationController
  def update
    @coupon = Coupon.find_by(code: coupon_params[:code])
    if @coupon&.active?
      update_status
      redirect_to cart_path, notice: t('coupon.valid') and return
    end

    redirect_to cart_path, alert: t('coupon.invalid')
  end

  private

  def update_status
    @coupon.update(order_id: current_cart.id, status: 'used')
  end

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end

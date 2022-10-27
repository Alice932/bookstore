# frozen_string_literal: true

class CouponsController < ApplicationController
  def update
    @coupon = Coupon.find_by(code: coupon_params[:code])
    if @coupon&.active?
      update_status
      redirect_to order_path, notice: t('coupon.valid')
    else
      redirect_to order_path, alert: t('coupon.invalid')
    end
  end

  private

  def update_status
    @coupon.used!
    @coupon.update(order_id: current_cart.id)
  end

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end

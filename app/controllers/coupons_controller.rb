# frozen_string_literal: true

class CouponsController < ApplicationController
  def update
    @coupon = Coupon.find_by(code: coupon_params[:code], status: 0)
    if @coupon
      @coupon.status = 1
      @coupon.cart_id = current_cart.id
      @coupon.save
      redirect_to cart_path, notice: t('coupon.valid')
    else
      redirect_to cart_path, alert: t('coupon.invalid')
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end

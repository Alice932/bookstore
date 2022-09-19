# frozen_string_literal: true

class AddressesController < ApplicationController
  def edit; end

  def create
    address_saving
  end

  def update
    address_saving
  end

  private

  def address_saving
    if address_with_type.save
      flash[:notice] = t('address.create')
      redirect_to root_url
    else
      flash[:alert] = t('address.failure')
      render :edit
    end
  end

  def address_with_type
    if addresses_params[:type] == 'BillingAddress'
      @billing_address = address_form
    else
      @shipping_address = address_form
    end
  end

  def address_form
    AddressForm.new(Address.find_or_initialize_by(user_id: current_user.id,
                                                  type: addresses_params[:type]), addresses_params)
  end

  def addresses_params
    params.require(:address).permit(:first_name, :last_name, :city, :country, :zip, :phone, :address, :type)
  end
end

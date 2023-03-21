# frozen_string_literal: true

RSpec.describe AddressForm, type: :model do
  describe 'billing address' do
    let!(:user) { create(:user) }
    let!(:billing_address) { build(:address, :billing_address, user:) }
    let!(:shipping_address) { build(:address, :shipping_address, user:) }
    let(:address_city) { 'Kiyv' }
    let(:country_id) { 'ID' }
    let(:address_phone) { '+380957225501' }

    context 'billing address' do
      let!(:result) { AddressForm.new(address_initialize, address_params).save }
      let(:expected_result) { BillingAddress }
      let(:address_params) do
        {
          first_name: billing_address.first_name,
          last_name: billing_address.last_name,
          address: billing_address.address,
          city: address_city,
          country: country_id,
          zip: billing_address.zip,
          phone: address_phone,
          type: I18n.t('address.type_billing')
        }
      end
      let!(:address_initialize) do
        Address.find_or_initialize_by(user_id: user.id, type: address_params[:type])
      end

      it { expect(result).to be_kind_of(expected_result) }
    end

    context 'shipping address' do
      let!(:result) { AddressForm.new(address_initialize, address_params).save }
      let(:expected_result) { ShippingAddress }
      let(:address_params) do
        {
          first_name: shipping_address.first_name,
          last_name: shipping_address.last_name,
          address: shipping_address.address,
          city: address_city,
          country: country_id,
          zip: shipping_address.zip,
          phone: address_phone,
          type: I18n.t('address.type_shipping')
        }
      end
      let!(:address_initialize) do
        Address.find_or_initialize_by(user_id: user.id, type: address_params[:type])
      end

      it { expect(result).to be_kind_of(expected_result) }
    end
  end
end

# frozen_string_literal: true

RSpec.describe 'Checkout page', type: :feature do
  let!(:order) { create(:order, order_items: [order_item]) }
  let!(:order_item) { create(:order_item) }
  let!(:user) { create(:user, orders: [order]) }
  let(:result) { page }

  before do
    sign_in user
  end

  describe 'Address' do
    context 'not use_billing' do
      before do
        visit checkout_path
        within('#billing') do
          fill_in 'first_name_field', with: first_name
          fill_in 'last_name_field', with: last_name
          fill_in 'address_field', with: address
          find(:select, 'country_field').first(:option, country).select_option
          fill_in 'city_field', with: city
          fill_in 'zip_field', with: zip
          fill_in 'phone_field', with: phone
        end

        within('#shipping') do
          fill_in 'first_name_field', with: first_name
          fill_in 'last_name_field', with: last_name
          fill_in 'address_field', with: address
          find(:select, 'country_field').first(:option, country).select_option
          fill_in 'city_field', with: city
          fill_in 'zip_field', with: zip
          fill_in 'phone_field', with: phone
        end
        click_button(I18n.t('checkouts.partials.address.button_submit'))
      end

      context 'data valid' do
        let(:first_name) { attributes_for(:address)[:first_name] }
        let(:last_name) { attributes_for(:address)[:last_name] }
        let(:address) { attributes_for(:address)[:address] }
        let(:city) { attributes_for(:address)[:city] }
        let(:zip) { attributes_for(:address)[:zip] }
        let(:country) { 'Ukraine' }
        let(:phone) { attributes_for(:address)[:phone] }

        it 'render next state delivery' do
          expect(result).to have_text(I18n.t('checkouts.partials.delivery.shipping_method_title'))
        end
      end

      context 'data invalid' do
        let(:first_name) { 'In_valiD1name' }
        let(:last_name) { attributes_for(:address)[:last_name] }
        let(:address) { attributes_for(:address)[:address] }
        let(:city) { attributes_for(:address)[:city] }
        let(:zip) { attributes_for(:address)[:zip] }
        let(:country) { 'Ukraine' }
        let(:phone) { attributes_for(:address)[:phone] }

        let(:result_billing) { user.billing_address }
        let(:result_shipping) { user.shipping_address }
        let(:expected_result) { I18n.t('address.validation.first_name') }

        it 'with errors' do
          expect(result).to have_text(expected_result)
        end

        it 'not create addresses for user' do
          expect(result_billing).to be_nil
          expect(result_shipping).to be_nil
        end
      end
    end

    context 'use billing' do
      let(:first_name) { attributes_for(:address)[:first_name] }
      let(:last_name) { attributes_for(:address)[:last_name] }
      let(:address) { attributes_for(:address)[:address] }
      let(:city) { attributes_for(:address)[:city] }
      let(:zip) { attributes_for(:address)[:zip] }
      let(:country) { 'Ukraine' }
      let(:phone) { attributes_for(:address)[:phone] }

      let(:result_shipping) { user.shipping_address }
      let(:expected_result) { user.billing_address }

      before do
        visit checkout_path
        within('#billing') do
          fill_in 'first_name_field', with: first_name
          fill_in 'last_name_field', with: last_name
          fill_in 'address_field', with: address
          find(:select, 'country_field').first(:option, country).select_option
          fill_in 'city_field', with: city
          fill_in 'zip_field', with: zip
          fill_in 'phone_field', with: phone
        end

        within('#shipping') do
          result.find(class: 'checkbox-input', visible: false).check
        end
        result.find(id: 'address_use_billing', visible: false).set(true)

        click_button(I18n.t('checkouts.partials.address.button_submit'))
      end

      it 'create shipping from billing' do
        expect(result_shipping).to eq(expected_result)
      end
    end
  end
end

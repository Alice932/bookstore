# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Edit Page' do
  context 'with valid details' do
    let!(:user) { create :user }
    let!(:billing_address) { build(:address, :billing_address, user:) }
    let!(:shipping_address) { build(:address, :shipping_address, user:) }
    let!(:city) { 'Kiyv' }
    let!(:country) { 'Indonesia' }
    let!(:country_id) { 'ID' }
    let!(:phone) { '+380957225501' }

    before do
      sign_in user
      visit edit_address_path(user)
    end

    context 'new billing address' do
      before do
        within('#billing_address') do
          fill_in 'first_name_field', with: billing_address.first_name
          fill_in 'last_name_field', with: billing_address.last_name
          fill_in 'address_field', with: billing_address.address
          find(:select, 'country_field').first(:option, country).select_option
          fill_in 'city_field', with: city
          fill_in 'zip_field', with: billing_address.zip
          fill_in 'phone_field', with: phone
          click_button(I18n.t('address.button_submit'))
        end
      end

      it 'billing address created' do
        expect(page).to have_text(I18n.t('address.create'))
      end
    end

    context 'new shipping address' do
      before do
        within('#shipping_address') do
          fill_in 'first_name_field', with: shipping_address.first_name
          fill_in 'last_name_field', with: shipping_address.last_name
          fill_in 'address_field', with: shipping_address.address
          find(:select, 'country_field').first(:option, country).select_option
          fill_in 'city_field', with: city
          fill_in 'zip_field', with: shipping_address.zip
          fill_in 'phone_field', with: phone
          click_button(I18n.t('address.button_submit'))
        end
      end

      it 'shipping address created' do
        expect(page).to have_text(I18n.t('address.create'))
      end
    end
  end
end

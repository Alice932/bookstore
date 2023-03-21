# frozen_string_literal: true

RSpec.describe 'Checkout page', type: :feature do
  let!(:order) { create(:order, order_items: [order_item]) }
  let!(:order_item) { create(:order_item) }
  let!(:user) { create(:user, orders: [order]) }
  let(:result) { page }

  before do
    sign_in user
  end

  describe 'Payment' do
    let(:delivery) { create(:delivery, orders: [order]) }
    let(:billing) { create(:address, :billing_address, user:) }
    let(:shipping) { create(:address, :shipping_address, user:) }
    let(:card_name) { card_name }
    let(:card_number) { card_number }
    let(:card_date) { card_date }
    let(:card_cvv) { card_cvv }
    let(:set_payment) do
      order.set_delivery!
      order.set_payment!
    end

    before do
      delivery
      billing
      shipping
      set_payment
      visit checkout_path
      fill_in 'payment[number]', with: card_number
      fill_in 'payment[name]', with: card_name
      fill_in 'payment[date]', with: card_date
      fill_in 'payment[cvv]', with: card_cvv
      click_button(I18n.t('checkouts.partials.payment.button_submit'))
    end

    context 'when valid' do
      let(:card_name) { attributes_for(:credit_card)[:name] }
      let(:card_number) { attributes_for(:credit_card)[:number] }
      let(:card_date) { attributes_for(:credit_card)[:date] }
      let(:card_cvv) { attributes_for(:credit_card)[:cvv] }
      let(:result_state) { Order.last.state }
      let(:expected_result) { 'confirm' }

      it 'change order.state to confirm' do
        expect(result_state).to eq(expected_result)
      end
    end

    context 'when invalid' do
      let(:card_name) { 'Som3_invAl1d' }
      let(:card_number) { attributes_for(:credit_card)[:number] }
      let(:card_date) { attributes_for(:credit_card)[:date] }
      let(:card_cvv) { attributes_for(:credit_card)[:cvv] }
      let(:result_state) { Order.last.state }
      let(:expected_result) { 'payment' }

      it 'not change order.state to confirm' do
        expect(result_state).to eq(expected_result)
      end

      it 'show errors about bad input' do
        expect(result).to have_text(I18n.t('checkouts.partials.payment.errors.card_name'))
      end
    end
  end
end

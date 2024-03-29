# frozen_string_literal: true

RSpec.describe 'Checkout page', type: :feature do
  let!(:order) { create(:order, order_items: [order_item]) }
  let!(:order_item) { create(:order_item) }
  let!(:user) { create(:user, orders: [order]) }
  let(:result) { page }

  before do
    sign_in user
  end

  describe 'Confirmation' do
    let(:set_confirmation) do
      order.set_delivery!
      order.set_payment!
      order.set_confirm!
    end
    let(:delivery) { create(:delivery, orders: [order]) }
    let(:card) { create(:credit_card, order:) }
    let(:billing) { create(:address, :billing_address, user:) }
    let(:shipping) { create(:address, :shipping_address, user:) }

    let(:expected_result_billing) { billing.first_name }
    let(:expected_result_shipping) { shipping.first_name }

    let(:expected_result_delivery) { delivery.name }
    let(:masked_number) { card.number[-4..] }
    let(:expected_result) { I18n.t('checkouts.partials.confirm.payment_info.masked_card', last_number: masked_number) }

    before do
      delivery
      card
      billing
      shipping
      set_confirmation
      visit checkout_path
    end

    it 'user can see info about shipping and billing addresses' do
      expect(result).to have_text(billing.first_name)
      expect(result).to have_text(shipping.first_name)
    end

    it 'user can see info about delivery' do
      expect(result).to have_text(expected_result_delivery)
    end

    it 'user can see info about credit_card' do
      expect(result).to have_text(expected_result)
    end

    context 'when user want change some data' do
      let(:link_to_address) { result.all('a', class: 'general-edit')[0] }
      let(:link_to_delivery) { result.all('a', class: 'general-edit')[2] }
      let(:link_to_payment) { result.all('a', class: 'general-edit')[3] }

      context 'when user want change some address' do
        let(:expected_result) { I18n.t('checkouts.partials.address.title') }

        before { link_to_address.click }

        it 'go back to address' do
          expect(result).to have_text(expected_result)
        end
      end

      context 'when user want change delivery' do
        let(:expected_result) { I18n.t('checkouts.partials.delivery.table.title') }

        before { link_to_delivery.click }

        it 'go back to delivery' do
          expect(result).to have_text(expected_result)
        end
      end

      context 'when user want change payment' do
        let(:expected_result) { I18n.t('checkouts.partials.payment.title') }

        before { link_to_payment.click }

        it 'go back to payment' do
          expect(result).to have_text(expected_result)
        end
      end
    end
  end
end

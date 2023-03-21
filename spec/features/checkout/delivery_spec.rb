# frozen_string_literal: true

RSpec.describe 'Checkout page', type: :feature do
  let!(:order) { create(:order, order_items: [order_item]) }
  let!(:order_item) { create(:order_item) }
  let!(:user) { create(:user, orders: [order]) }
  let(:result) { page }

  before do
    sign_in user
  end

  describe 'Delivery' do
    let!(:delivery) { create(:delivery) }
    let(:billing_address) { create(:address, :billing_address, user:) }
    let(:shipping_address) { create(:address, :shipping_address, user:) }

    let(:expected_result_delyvery_show) { delivery.name }

    before do
      delivery
      order.set_delivery!
      visit checkout_path
    end

    it 'all available delivery' do
      expect(result).to have_text(expected_result_delyvery_show)
    end
  end
end

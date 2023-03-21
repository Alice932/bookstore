# frozen_string_literal: true

RSpec.describe 'Checkout page', type: :feature do
  let!(:order) { create(:order, order_items: [order_item]) }
  let!(:order_item) { create(:order_item) }
  let!(:user) { create(:user, orders: [order]) }
  let(:result) { page }

  before do
    sign_in user
  end

  describe 'Complete' do
    let(:set_complete) do
      order.set_delivery!
      order.set_payment!
      order.set_confirm!
      order.set_complete!
    end
    let(:delivery) { create(:delivery, orders: [order]) }
    let(:card) { create(:credit_card, order:) }
    let(:billing) { create(:address, :billing_address, user:) }
    let(:shipping) { create(:address, :shipping_address, user:) }

    let(:expected_result_number) { order.number }
    let(:expected_result_message) { I18n.t('checkouts.partials.complete.title') }

    before do
      delivery
      card
      billing
      shipping
      set_complete
      visit checkout_path
    end

    it 'user can see order number' do
      expect(result).to have_text(expected_result_number)
    end

    it 'user can see message' do
      expect(result).to have_text(expected_result_message)
    end

    context 'when user click on Go to Store' do
      before do
        result.find('a', class: 'btn btn-default mb-20').click
      end

      it 'redirect_to courses_path' do
        expect(result.current_path).to eq(courses_path)
      end
    end
  end
end

# frozen_string_literal: true

RSpec.describe CreditCardForm, type: :model do
  let!(:order) { create(:order) }
  let(:params) do
    { name: credit_card.name, number: credit_card.number, date: credit_card.date, cvv: credit_card.cvv,
      order_id: order.id }
  end
  let(:credit_card_class) { CreditCard.find_or_initialize_by(order_id: order.id) }
  let(:credit_form) { described_class.new(credit_card, params) }
  let(:result) { order.credit_card }

  before { credit_form.save }

  context 'valid data' do
    let!(:credit_card) { create(:credit_card) }
    let(:expected_result) { credit_card }

    it 'create credit card' do
      expect(result).to eq(expected_result)
    end
  end
end

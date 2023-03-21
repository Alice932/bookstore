# frozen_string_literal: true

RSpec.describe Order, type: :model do
  describe 'fields exist' do
    it { is_expected.to have_db_column(:number).of_type(:string).with_options(null: true) }
  end

  describe 'relations' do
    it { should have_one(:coupon) }
    it { should have_many(:courses) }
    it { should have_many(:order_items) }
  end

  describe 'have indexes' do
    it { should have_db_index(:user_id) }
  end
end

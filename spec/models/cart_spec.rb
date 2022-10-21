# frozen_string_literal: true

RSpec.describe Cart, type: :model do
  describe 'relations' do
    it { should have_one(:coupon) }
    it { should have_many(:books) }
    it { should have_many(:cart_items) }
  end

  describe 'have indexes' do
    it { should have_db_index(:user_id) }
  end
end

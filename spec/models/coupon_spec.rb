# frozen_string_literal: true

RSpec.describe Coupon, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:discount) }
  end

  describe 'fields exist' do
    it { should have_db_column(:code).of_type(:string) }
    it { should have_db_column(:discount).of_type(:float) }
    it { should have_db_column(:status).of_type(:integer) }
  end

  describe 'have indexes' do
    it { should have_db_index(:order_id) }
  end
end

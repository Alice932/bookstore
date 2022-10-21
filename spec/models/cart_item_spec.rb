# frozen_string_literal: true

RSpec.describe CartItem, type: :model do
  describe 'fields exist' do
    it { should have_db_column(:quantity).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:book) }
    it { should belong_to(:cart) }
  end

  describe 'have indexes' do
    it { should have_db_index(:cart_id) }
    it { should have_db_index(:book_id) }
  end
end

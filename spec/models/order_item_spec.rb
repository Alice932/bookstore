# frozen_string_literal: true

RSpec.describe OrderItem, type: :model do
  describe 'fields exist' do
    it { should have_db_column(:quantity).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:course) }
    it { should belong_to(:order) }
  end

  describe 'have indexes' do
    it { should have_db_index(:order_id) }
    it { should have_db_index(:course_id) }
  end
end

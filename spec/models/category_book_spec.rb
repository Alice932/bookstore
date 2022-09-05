# frozen_string_literal: true

RSpec.describe CategoryBook, type: :model do
  describe 'fields exist' do
    it { should have_db_column(:category_id).of_type(:integer) }
    it { should have_db_column(:book_id).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:book) }
    it { should belong_to(:category) }
  end

  describe 'have indexes' do
    it { should have_db_index(:category_id) }
    it { should have_db_index(:book_id) }
  end
end

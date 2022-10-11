# frozen_string_literal: true

RSpec.describe BookPhoto, type: :model do
  describe 'fields exist' do
    it { should have_db_column(:image_data).of_type(:text) }
    it { should have_db_column(:book_id).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:book) }
  end

  describe 'have indexes' do
    it { should have_db_index(:book_id) }
  end
end

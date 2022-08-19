# frozen_string_literal: true

RSpec.describe AuthorBook, type: :model do
  let!(:author) { create(:author) }
  let!(:book) { create(:book) }
  subject { build(:author_book, author_id: author.id, book_id: book.id) }

  describe 'column exist' do
    it { should have_db_column(:author_id).of_type(:integer) }
    it { should have_db_column(:book_id).of_type(:integer) }
  end

  describe 'belongs to' do
    it { should belong_to(:book) }
    it { should belong_to(:author) }
  end

  describe 'have indexes' do
    it { should have_db_index(:author_id) }
    it { should have_db_index(:book_id) }
  end
end

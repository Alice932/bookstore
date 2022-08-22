# frozen_string_literal: true

RSpec.describe Book, type: :model do
  let!(:author) { create(:author) }
  subject { build(:book) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end

  describe 'fields exist' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:price).of_type(:integer) }
  end

  describe 'relations' do
    it { should have_many(:author_books) }
    it { should have_many(:authors) }
  end
end

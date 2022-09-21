# frozen_string_literal: true

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'fields exist' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'relations' do
    it { should have_many(:category_books) }
    it { should have_many(:books) }
  end
end

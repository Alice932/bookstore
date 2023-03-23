# frozen_string_literal: true

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'fields exist' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:description).of_type(:string) }
  end

  describe 'relations' do
    it { should have_many(:author_books) }
    it { should have_many(:books) }
  end
end

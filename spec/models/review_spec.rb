# frozen_string_literal: true

RSpec.describe Review, type: :model do
  describe 'validations' do
    let!(:review) { create :review }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:review_text) }
    it { expect(review.valid?(review.title)).to be_truthy }
    it { expect(review.valid?(review.review_text)).to be_truthy }
  end

  describe 'fields exist' do
    it { should have_db_column(:score).of_type(:integer) }
    it { should have_db_column(:title).with_options(null: false).of_type(:string) }
    it { should have_db_column(:name).with_options(null: false).of_type(:string) }
    it { should have_db_column(:review_text).with_options(null: false).of_type(:string) }
    it { should have_db_column(:status).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:user) }
    it { should belong_to(:course) }
  end

  describe 'have indexes' do
    it { should have_db_index(:user_id) }
    it { should have_db_index(:course_id) }
  end
end

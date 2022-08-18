# frozen_string_literal: true

RSpec.describe Book, type: :model do
  describe 'validations' do
    let!(:author) { create(:author) }
    subject { build(:book) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:price) }
  end
end

# frozen_string_literal: true

RSpec.describe BookPhoto, type: :model do
  describe 'fields exist' do
    it { should have_db_column(:image_data).of_type(:text) }
    it { should have_db_column(:course_id).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:course) }
  end

  describe 'have indexes' do
    it { should have_db_index(:course_id) }
  end
end

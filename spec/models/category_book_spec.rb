# frozen_string_literal: true

RSpec.describe CategoryBook, type: :model do
  describe 'fields exist' do
    it { should have_db_column(:category_id).of_type(:integer) }
    it { should have_db_column(:course_id).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:course) }
    it { should belong_to(:category) }
  end

  describe 'have indexes' do
    it { should have_db_index(:category_id) }
    it { should have_db_index(:course_id) }
  end
end

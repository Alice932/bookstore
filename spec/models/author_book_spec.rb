# frozen_string_literal: true

RSpec.describe AuthorBook, type: :model do
  describe 'fields exist' do
    it { should have_db_column(:coach_id).of_type(:integer) }
    it { should have_db_column(:course_id).of_type(:integer) }
  end

  describe 'relations' do
    it { should belong_to(:course) }
    it { should belong_to(:coach) }
  end

  describe 'have indexes' do
    it { should have_db_index(:coach_id) }
    it { should have_db_index(:course_id) }
  end
end

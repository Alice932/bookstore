# frozen_string_literal: true

RSpec.describe Address, type: :model do
  # describe 'validations' do
  #   it { should validate_length_of(:first_name).is_at_least(3)}
  #   it { should validate_length_of(:last_name).is_at_least(3)}
  # end

  describe 'fields exist' do
    it { should have_db_column(:first_name).with_options(null: false).of_type(:string) }
    it { should have_db_column(:last_name).with_options(null: false).of_type(:string) }
    it { should have_db_column(:address).with_options(null: false).of_type(:string) }
    it { should have_db_column(:city).with_options(null: false).of_type(:string) }
    it { should have_db_column(:zip).with_options(null: false).of_type(:string) }
    it { should have_db_column(:country).with_options(null: false).of_type(:string) }
    it { should have_db_column(:phone).with_options(null: false).of_type(:string) }
    it { should have_db_column(:type).with_options(null: false).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:created_at).with_options(null: false).of_type(:datetime) }
    it { should have_db_column(:updated_at).with_options(null: false).of_type(:datetime) }
  end
  describe 'have indexes' do
    it { should have_db_index(:user_id) }
  end

  describe 'relations' do
    it { should belong_to :user }
  end
end

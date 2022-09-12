# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { create :user }
    it { expect(user.valid_password?(user.password)).to be_truthy }
  end

  describe 'fields exist' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:confirmation_token).of_type(:string) }
    it { should have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { should have_db_column(:unconfirmed_email).of_type(:string) }
    it { should have_db_column(:full_name).of_type(:string) }
    it { should have_db_column(:uid).of_type(:string) }
    it { should have_db_column(:avatar_url).of_type(:string) }
    it { should have_db_column(:provider).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'have indexes' do
    it { should have_db_index(:confirmation_token) }
    it { should have_db_index(:email) }
    it { should have_db_index(:reset_password_token) }
  end
end

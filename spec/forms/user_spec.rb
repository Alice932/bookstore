# frozen_string_literal: true

RSpec.describe UserForm, type: :model do
  describe 'updating user form' do
    let!(:user) { create(:user) }

    before { create_form.save }

    context 'email updating' do
      let(:create_form) { UserForm.new(user, email_params) }
      let(:expected_result) { email_params[:email] }
      let(:email_params) { { email: I18n.t('test.user_form.email') } }
      let(:result) { create_form.email }

      it { expect(result).to eq(expected_result) }
    end

    context 'password updating' do
      let(:create_form) { UserForm.new(user, password_params) }
      let(:password_params) do
        {
          current_password: user.password,
          password: I18n.t('test.user_form.password'),
          password_confirmation: I18n.t('test.user_form.password')
        }
      end
      let(:result) { user.valid_password?(password_params[:password]) }

      it { expect(result).to be_truthy }
    end
  end
end

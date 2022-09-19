# frozen_string_literal: true

RSpec.describe 'devise requests', type: :request do
  let(:user) { create(:user) }
  context 'GET registration path' do
    before do
      get new_user_registration_path
    end

    it { expect(response).to have_http_status(:success) }
  end

  context 'GET session path' do
    before do
      get new_user_session_path
    end

    it { expect(response).to have_http_status(:success) }
  end

  context 'GET password recovery path' do
    before do
      get new_user_password_path
    end

    it { expect(response).to have_http_status(:success) }
  end

  context 'sign in' do
    before do
      sign_in user
      get root_path
    end

    it { expect(response).to have_http_status(:success) }
    it { should render_template('index') }
  end

  context 'sign_out' do
    before do
      sign_in user
    end

    it 'have signed out' do
      sign_out user
      get root_path

      should render_template('index')
      expect(response).to have_http_status(:success)
    end
  end
end

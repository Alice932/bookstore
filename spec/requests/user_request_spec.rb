# frozen_string_literal: true

RSpec.describe 'user requests', type: :request do
  let(:user) { create(:user) }
  before { sign_in user }
  describe 'GET #edit' do
    before do
      get edit_user_path(user.id)
    end

    it { expect(response).to have_http_status(:success) }
    it { should render_template('edit') }
  end
end

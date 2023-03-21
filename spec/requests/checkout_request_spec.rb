# frozen_string_literal: true

RSpec.describe CheckoutsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }
  describe 'GET #show' do
    before { get :show }

    it { expect(response).to have_http_status(:success) }
    it { should render_template('show') }
  end
end

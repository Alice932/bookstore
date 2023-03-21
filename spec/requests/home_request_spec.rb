# frozen_string_literal: true

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { should render_template('index') }
  end
end

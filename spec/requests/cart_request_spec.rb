# frozen_string_literal: true

RSpec.describe OrdersController, type: :controller do
  describe 'GET #show' do
    before { get :show }

    it { expect(response).to have_http_status(:success) }
    it { should render_template('show') }
  end
end

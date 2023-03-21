# frozen_string_literal: true

RSpec.describe 'address requests', type: :request do
  let(:user) { create(:user) }
  before { sign_in user }
  describe 'GET #edit empty' do
    before do
      get edit_address_path(user.id)
    end

    it { expect(response).to have_http_status(:success) }
    it { should render_template('edit') }
  end

  describe 'GET #edit filled' do
    let!(:billing_address) { create(:address, :billing_address, user:) }
    let!(:shipping_address) { create(:address, :shipping_address, user:) }
    before do
      get edit_address_path(user.id)
    end

    it { expect(response).to have_http_status(:success) }
    it { should render_template('edit') }
  end
end

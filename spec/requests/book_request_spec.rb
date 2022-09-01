# frozen_string_literal: true

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
  end
  describe 'POST #index' do
    before { post :index }

    it { expect(response).to have_http_status(:success) }
  end
end

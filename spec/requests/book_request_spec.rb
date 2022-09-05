# frozen_string_literal: true

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { expect(response).to have_http_status(:ok) }
  end
  describe 'POST #index' do
    before { post :index }

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'filtering #index' do
    let!(:request_category) { create :category }
    before { get :index, params: { category_id: request_category.id } }

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'sorting #index' do
    context 'title_asc' do
      before { get :index, params: { filter: 'title_asc' } }
      it { expect(response).to have_http_status(:ok) }
    end

    context 'title_desc' do
      before { get :index, params: { filter: 'title_desc' } }
      it { expect(response).to have_http_status(:ok) }
    end

    context 'price_asc' do
      before { get :index, params: { filter: 'price_asc' } }
      it { expect(response).to have_http_status(:ok) }
    end

    context 'price_desc' do
      before { get :index, params: { filter: 'price_desc' } }
      it { expect(response).to have_http_status(:ok) }
    end
  end

  describe 'filtering and sorting #index' do
    let!(:request_category) { create :category }
    before { get :index, params: { category_id: request_category.id, filter: 'title_asc' } }

    it { expect(response).to have_http_status(:ok) }
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home Page', type: :request do
  it 'have ok status' do
    get root_path
    expect(response).to have_http_status(:ok)
  end
end

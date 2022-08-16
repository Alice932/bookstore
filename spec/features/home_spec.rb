# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Home Page' do
  let(:first_book) { create :book }
  context 'right text on page' do
    # it 'have start button' do
    #   visit root_path
    #   expect(page).to have_button('Get Started')
    # end

    it 'have welcome message' do
      visit root_path
      expect(page).to have_content('Welcome to our amazing Bookstore!')
    end

    it 'have start button' do
      visit root_path
      expect(page).to have_button('Get Started')
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Home Page' do
  let(:first_book) { create :book }
  let(:second_book) { create :book }
  let(:third_book) { create :book }
  let(:fourth_book) { create :book }

  context 'right text on page' do
    before do
      first_book
      second_book
      third_book
      fourth_book
      visit root_path
    end

    it 'have a one book' do
      expect(page).to have_content(first_book.title)
    end

    it 'have four books' do
      expect(page).to have_content(first_book.title)
      expect(page).to have_content(second_book.title)
      expect(page).to have_content(third_book.title)
      expect(page).to have_content(fourth_book.title)
    end

    it 'have welcome message' do
      expect(page).to have_content('Welcome to our amazing Bookstore!')
    end

    it 'have start button' do
      expect(page).to have_button('Get Started')
    end
  end
end

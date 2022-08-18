# frozen_string_literal: true

RSpec.describe 'Home Page' do
  let!(:author) { create :author }
  let!(:first_book) { build :book }
  let!(:second_book) { build :book }
  let!(:third_book) { build :book }
  let!(:fourth_book) { build :book }

  context 'right text on page' do
    before do
      visit root_path
    end

    # it 'have a one book' do
    #   expect(page).to have_content(first_book.title)
    # end

    # it 'have four books' do
    #   expect(page).to have_content(first_book.title)
    #   expect(page).to have_content(second_book.title)
    #   expect(page).to have_content(third_book.title)
    #   expect(page).to have_content(fourth_book.title)
    # end

    it 'have welcome message' do
      expect(page).to have_content('Welcome to our amazing Bookstore!')
    end

    it 'have start button' do
      expect(page).to have_button('Get Started')
    end
  end
end

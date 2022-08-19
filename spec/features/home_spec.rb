# frozen_string_literal: true

RSpec.describe 'Home Page' do
  context 'right text on page' do
    let!(:author) { create :author }
    let!(:first_book) { create :book }
    let!(:second_book) { create :book }
    let!(:third_book) { create :book }
    let!(:fourth_book) { create :book }
    let!(:author_books) { create :author_book, book_id: first_book.id, author_id: author.id }

    before do
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

    it 'have author name' do
      expect(page).to have_content(author.name)
    end
  end
end

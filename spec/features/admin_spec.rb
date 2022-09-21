# frozen_string_literal: true

require 'rails_helper'
# include Devise::TestHelpers

describe 'Admin page' do
  let!(:admin) { create :admin_user }

  describe 'Author' do
    let!(:author) { create :author }
    let(:builded_author) { build :author }

    before do
      visit new_admin_user_session_path
      fill_in 'admin_user_email', with: admin.email
      fill_in 'admin_user_password', with: admin.password
      find_button('Login').click
    end

    it { expect(page).to have_content('Signed in successfully.') }

    context 'creates author' do
      before do
        visit admin_authors_path
        click_link 'New Author'
        fill_in 'author_first_name', with: builded_author.first_name
        fill_in 'author_last_name', with: builded_author.last_name
        fill_in 'author_description', with: builded_author.description
        find_button('Create Author').click
      end

      it { expect(page).to have_content('Author was successfully created.') }
    end

    context 'edit author' do
      before do
        visit edit_admin_author_path(author.id)
        fill_in 'author_first_name', with: builded_author.first_name
        find_button('Update Author').click
      end

      it { expect(page).to have_content('Author was successfully updated.') }
    end

    context 'delete author' do
      before do
        visit admin_author_path(author.id)
        find_link('Delete Author').click
      end

      it { expect(page).to have_content('Author was successfully destroyed.') }
    end
  end

  describe 'Book' do
    let!(:book) { create :book }
    let!(:builded_book) { build :book }

    before do
      visit new_admin_user_session_path
      fill_in 'admin_user_email', with: admin.email
      fill_in 'admin_user_password', with: admin.password
      find_button('Login').click
    end

    context 'create book' do
      before do
        visit admin_books_path
        click_link 'New Book'
        fill_in 'book_title', with: builded_book.title
        fill_in 'book_description', with: builded_book.description
        fill_in 'book_price', with: builded_book.price
        fill_in 'book_publication_date', with: builded_book.publication_date
        fill_in 'book_materials', with: builded_book.materials
        fill_in 'book_dimensions', with: builded_book.dimensions
        find_button('Create Book').click
      end

      it { expect(page).to have_content('Book was successfully created.') }
    end

    context 'edit book' do
      before do
        visit edit_admin_book_path(book.id)
        fill_in 'book_title', with: builded_book.title
        find_button('Update Book').click
      end

      it { expect(page).to have_content('Book was successfully updated.') }
    end

    context 'delete book' do
      before do
        visit admin_book_path(book.id)
        find_link('Delete Book').click
      end

      it { expect(page).to have_content('Book was successfully destroyed.') }
    end
  end

  describe 'Category' do
    let!(:category) { create :category }
    let!(:builded_category) { build :category }

    before do
      visit new_admin_user_session_path
      fill_in 'admin_user_email', with: admin.email
      fill_in 'admin_user_password', with: admin.password
      find_button('Login').click
    end

    context 'create category' do
      before do
        visit admin_categories_path
        click_link 'New Category'
        fill_in 'category_name', with: builded_category.name
        find_button('Create Category').click
      end

      it { expect(page).to have_content('Category was successfully created.') }
    end

    context 'edit category' do
      before do
        visit edit_admin_category_path(category.id)
        fill_in 'category_name', with: builded_category.name
        find_button('Update Category').click
      end

      it { expect(page).to have_content('Category was successfully updated.') }
    end

    context 'delete category' do
      before do
        visit admin_category_path(category.id)
        find_link('Delete Category').click
      end

      it { expect(page).to have_content('Category was successfully destroyed.') }
    end
  end
end

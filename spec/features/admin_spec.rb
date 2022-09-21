# frozen_string_literal: true

require 'rails_helper'

describe 'Admin page' do
  let!(:admin) { create :admin_user }

  subject do
    visit new_admin_user_session_path
    fill_in 'admin_user_email', with: admin.email
    fill_in 'admin_user_password', with: admin.password
    find_button(I18n.t('active_admin.login')).click
  end

  describe 'Author' do
    let!(:author) { create :author }
    let(:builded_author) { build :author }

    before do
      subject
    end

    it { expect(page).to have_content(I18n.t('active_admin.sign_in')) }

    context 'creates author' do
      before do
        visit admin_authors_path
        click_link I18n.t('active_admin.new_model', model: 'Author')
        fill_in 'author_first_name', with: builded_author.first_name
        fill_in 'author_last_name', with: builded_author.last_name
        fill_in 'author_description', with: builded_author.description
        find_button(I18n.t('active_admin.create_model', model: 'Author')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Author')) }
    end

    context 'edit author' do
      before do
        visit edit_admin_author_path(author.id)
        fill_in 'author_first_name', with: builded_author.first_name
        find_button(I18n.t('active_admin.update_model', model: 'Author')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Author')) }
    end

    context 'delete author' do
      before do
        visit admin_author_path(author.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Author')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Author')) }
    end
  end

  describe 'Book' do
    let!(:book) { create :book }
    let!(:builded_book) { build :book }

    before do
      subject
    end

    context 'create book' do
      before do
        visit admin_books_path
        click_link I18n.t('active_admin.new_model', model: 'Book')
        fill_in 'book_title', with: builded_book.title
        fill_in 'book_description', with: builded_book.description
        fill_in 'book_price', with: builded_book.price
        fill_in 'book_publication_date', with: builded_book.publication_date
        fill_in 'book_materials', with: builded_book.materials
        fill_in 'book_dimensions', with: builded_book.dimensions
        find_button(I18n.t('active_admin.create_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Book')) }
    end

    context 'edit book' do
      before do
        visit edit_admin_book_path(book.id)
        fill_in 'book_title', with: builded_book.title
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'delete book' do
      before do
        visit admin_book_path(book.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Book')) }
    end
  end

  describe 'Category' do
    let!(:category) { create :category }
    let!(:builded_category) { build :category }

    before do
      subject
    end

    context 'create category' do
      before do
        visit admin_categories_path
        click_link I18n.t('active_admin.new_model', model: 'Category')
        fill_in 'category_name', with: builded_category.name
        find_button(I18n.t('active_admin.create_model', model: 'Category')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Category')) }
    end

    context 'edit category' do
      before do
        visit edit_admin_category_path(category.id)
        fill_in 'category_name', with: builded_category.name
        find_button(I18n.t('active_admin.update_model', model: 'Category')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Category')) }
    end

    context 'delete category' do
      before do
        visit admin_category_path(category.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Category')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Category')) }
    end
  end
end

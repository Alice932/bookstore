# frozen_string_literal: true

describe 'Admin page', js: true do
  let!(:admin) { create :admin_user }

  subject do
    visit new_admin_user_session_path
    fill_in 'admin_user_email', with: admin.email
    fill_in 'admin_user_password', with: admin.password
    find_button(I18n.t('active_admin.login')).click
  end

  describe 'Author' do
    let!(:author) { create :author }
    let(:author_attributes) { FactoryBot.attributes_for(:author) }

    before do
      subject
    end

    it { expect(page).to have_content(I18n.t('active_admin.sign_in')) }

    context 'creates author' do
      before do
        visit admin_authors_path
        click_link I18n.t('active_admin.new_model', model: 'Author')
        fill_in 'author_first_name', with: author_attributes[:first_name]
        fill_in 'author_last_name', with: author_attributes[:last_name]
        fill_in 'author_description', with: author_attributes[:description]
        find_button(I18n.t('active_admin.create_model', model: 'Author')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Author')) }
    end

    context 'edit author' do
      before do
        visit edit_admin_author_path(author.id)
        fill_in 'author_first_name', with: author_attributes[:first_name]
        find_button(I18n.t('active_admin.update_model', model: 'Author')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Author')) }
    end

    context 'delete author' do
      before do
        visit admin_author_path(author.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Author')).click
        accept_alert
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Author')) }
    end
  end

  describe 'Book' do
    let!(:book) { create :book }
    let(:book_attributes) { FactoryBot.attributes_for(:book) }

    before do
      subject
    end

    context 'create book' do
      before do
        visit admin_books_path
        click_link I18n.t('active_admin.new_model', model: 'Book')
        fill_in 'book_title', with: book_attributes[:title]
        fill_in 'book_description', with: book_attributes[:description]
        fill_in 'book_price', with: book_attributes[:price]
        fill_in 'book_publication_date', with: book_attributes[:publication_date]
        fill_in 'book_materials', with: book_attributes[:materials]
        fill_in 'book_dimensions', with: book_attributes[:dimensions].first
        find_button(I18n.t('active_admin.create_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Book')) }
    end

    context 'attach author' do
      let!(:author) { create :author }
      before do
        visit edit_admin_book_path(book.id)
        find_link(I18n.t('active_admin.add_author')).click
        select "#{author.first_name} #{author.last_name}", from: 'book_author_books_attributes_0_author_id'
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'attach category' do
      let!(:category) { create :category }
      before do
        visit edit_admin_book_path(book.id)
        find_link(I18n.t('active_admin.add_category')).click
        select category.name, from: 'book_category_books_attributes_0_category_id'
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'edit book' do
      before do
        visit edit_admin_book_path(book.id)
        fill_in 'book_title', with: book_attributes[:title]
        find_button(I18n.t('active_admin.update_model', model: 'Book')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Book')) }
    end

    context 'delete book' do
      before do
        visit admin_book_path(book.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Book')).click
        accept_alert
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Book')) }
    end
  end

  describe 'Category' do
    let!(:category) { create :category }
    let(:category_attributes) { FactoryBot.attributes_for(:category) }

    before do
      subject
    end

    context 'create category' do
      before do
        visit admin_categories_path
        click_link I18n.t('active_admin.new_model', model: 'Category')
        fill_in 'category_name', with: category_attributes[:name]
        find_button(I18n.t('active_admin.create_model', model: 'Category')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_create', model: 'Category')) }
    end

    context 'edit category' do
      before do
        visit edit_admin_category_path(category.id)
        fill_in 'category_name', with: category_attributes[:name]
        find_button(I18n.t('active_admin.update_model', model: 'Category')).click
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_update', model: 'Category')) }
    end

    context 'delete category' do
      before do
        visit admin_category_path(category.id)
        find_link(I18n.t('active_admin.delete_model', model: 'Category')).click
        accept_alert
      end

      it { expect(page).to have_content(I18n.t('active_admin.success_delete', model: 'Category')) }
    end
  end
end

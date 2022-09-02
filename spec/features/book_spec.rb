# frozen_string_literal: true

RSpec.describe 'Book Page' do
  context 'right text on page' do
    let!(:author) { create :author }

    let!(:first_book) { create :book }
    let!(:second_book) { create :book }

    let(:books_count) { 2 }

    let!(:first_category) { create :category }
    let!(:second_category) { create :category }
    let!(:third_category) { create :category }

    let!(:first_author_books) { create :author_book, book_id: first_book.id, author_id: author.id }
    let!(:second_author_books) { create :author_book, book_id: second_book.id, author_id: author.id }

    let!(:first_category_books) { create :category_book, book_id: first_book.id, category_id: first_category.id }
    let!(:second_category_books) { create :category_book, book_id: second_book.id, category_id: second_category.id }

    describe 'index page' do
      let(:books_list) { [first_book, second_book] }

      before do
        visit books_path
      end

      it 'have a one book' do
        expect(page).to have_content(first_book.title)
      end

      it 'have names of categories' do
        expect(page).to have_content(first_category.category_name)
        expect(page).to have_content(second_category.category_name)
      end

      it 'have books by category' do
        click_link(first_category.category_name)
        expect(page).to have_content(first_book.title)
        expect(page).to have_no_content(second_book.title)
      end

      it 'have not books by empty category' do
        click_link(third_category.category_name)
        expect(page).to have_no_content(first_book.title)
        expect(page).to have_no_content(second_book.title)
      end

      context 'sorting' do
        it 'sort by title desc' do
          click_link('sort_list')
          click_link(I18n.t('books.catalog.sort.title_desc'))
          expect(page).to have_content(first_book.title)
        end

        it 'displays created_at filter first' do
          books_titles = books_list.sort_by(&:created_at).reverse.map(&:title)
          displayed_titles = page.all('p.title').first(books_count).map(&:text)
          expect(books_titles).to eq displayed_titles
        end

        it 'sorts by title desc' do
          books_titles = books_list.map(&:title).sort.reverse
          click_link('sort_list')
          click_link(I18n.t('books.catalog.sort.title_desc'))
          displayed_titles = page.all('p.title').first(books_count).map(&:text)
          expect(books_titles).to eq displayed_titles
        end

        it 'sorts by title asc' do
          books_titles = books_list.map(&:title).sort
          click_link('sort_list')
          click_link(I18n.t('books.catalog.sort.title_asc'))
          displayed_titles = page.all('p.title').first(books_count).map(&:text)
          expect(books_titles).to eq displayed_titles
        end

        it 'sorts by price desc' do
          books_titles = books_list.sort_by(&:price).map(&:title).reverse
          click_link('sort_list')
          click_link(I18n.t('books.catalog.sort.price_desc'))
          displayed_titles = page.all('p.title').first(books_count).map(&:text)
          expect(books_titles).to eq displayed_titles
        end

        it 'sorts by price asc' do
          books_titles = books_list.sort_by(&:price).map(&:title)
          click_link('sort_list')
          click_link(I18n.t('books.catalog.sort.price_asc'))
          displayed_titles = page.all('p.title').first(books_count).map(&:text)
          expect(books_titles).to eq displayed_titles
        end
      end
    end

    context 'with view more button' do
      let(:view_more_button) { I18n.t('books.index.view_more') }
      let!(:books) { create_list(:book, 20) }

      before { visit books_path }

      it 'displays View more button if not all books displayed' do
        expect(page).to have_content(view_more_button)
      end

      it 'disables View more button if all books displayed' do
        find('button.btn.btn-primary').click
        expect(page).not_to have_content(I18n.t('books.index.view_more'))
      end
    end

    describe 'show' do
      before do
        visit book_path(first_book)
      end

      it 'have a title of book' do
        expect(page).to have_content(first_book.title)
      end

      it 'have book params' do
        expect(page).to have_content(first_book.description)
        expect(page).to have_content(first_book.price)
        expect(page).to have_content(first_book.publication_date)
        expect(page).to have_content(first_book.materials)
        expect(page).to have_content(first_book.dimensions.split('"').max(3).join(', '))
      end
    end
  end
end

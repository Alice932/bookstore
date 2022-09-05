# frozen_string_literal: true

class SortBooksService
  def initialize(params)
    @category_id = params[:category_id]
    @filter = params[:filter]&.to_sym || Constants::Books::BOOK_DEFAULT_FILTER
  end

  def call
    order_by_filter
  end

  private

  def find_books
    @find_books ||= @category_id ? books_with_category : books
  end

  def books
    Book.all.includes(Constants::Books::INCLUDES_OPTIONS)
  end

  def books_with_category
    Category.find_by(id: @category_id).books.includes(Constants::Books::INCLUDES_OPTIONS)
  end

  def order_by_filter
    find_books.order(Constants::Books::BOOK_FILTERS[@filter])
  end
end

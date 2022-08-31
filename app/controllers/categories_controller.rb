# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @pagy, @books = pagy_countless(scoped_books, link_extra: 'data-remote="true"', items: BOOKS_PER_PAGE)
    @filters = SortBooksService::BOOK_FILTERS
  end

  def scoped_books
    SortBooksService.new(params).call
  end
end

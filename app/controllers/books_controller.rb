# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend
  BOOKS_PER_PAGE = 12

  decorates_assigned :book, :books

  def index
    @pagy, @books = pagy_countless(scoped_books, items: BOOKS_PER_PAGE)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @categories = Category.all
    @filters = SortBooksService::BOOK_FILTERS
    @book = Book.find(params[:id])
  end

  def scoped_books
    SortBooksService.new(params).call
  end
end

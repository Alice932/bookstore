# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend

  decorates_assigned :book, :books

  def index
    @books_count = Book.all.count
    @pagy, @books = pagy_countless(scoped_books, items: BooksHelper::BOOKS_PER_PAGE)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @categories = Category.all
    @filters = BooksHelper::BOOK_FILTERS
    @book = Book.find(params[:id])
  end

  def scoped_books
    SortBooksService.new(params).call
  end
end

# frozen_string_literal: true

class HomeController < ApplicationController
  decorates_assigned :book, :books

  def index
    @books = Book.all.includes(%i[author_books authors]).limit(Constants::Books::LATEST_BOOK_COUNT)
    @new_books = Book.all.includes(%i[author_books
                                      authors]).limit(Constants::Books::NEW_BOOKS_COUNT).order(created_at: :desc)
  end
end

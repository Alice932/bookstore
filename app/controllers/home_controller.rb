# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.all.includes(%i[author_books authors]).limit(Book::LATEST_BOOK_COUNT)
    @new_books = Book.all.includes(%i[author_books authors]).limit(Book::NEW_BOOKS_COUNT).order(created_at: :desc)
  end
end

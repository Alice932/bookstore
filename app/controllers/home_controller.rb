# frozen_string_literal: true

class HomeController < ApplicationController
  decorates_assigned :book, :books

  def index
    @books = Book.includes(Constants::Books::INCLUDES_OPTIONS).limit(Constants::Books::LATEST_BOOK_COUNT)
    unordered_books = Book.includes(Constants::Books::INCLUDES_OPTIONS).limit(Constants::Books::NEW_BOOKS_COUNT)
    @new_books = unordered_books.order(created_at: :desc)
  end
end

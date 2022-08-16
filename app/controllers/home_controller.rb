# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.all
    @last_three_books = @books.reverse[0..2]
    @sorted_books = @books.sort_by(&:sales_count).reverse[0..3]
  end
end

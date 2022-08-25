# frozen_string_literal: true

class Book < ApplicationRecord
  LATEST_BOOK_COUNT = 4
  NEW_BOOKS_COUNT = 3

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :category_books, dependent: :destroy
  has_many :categories, through: :category_books

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

# frozen_string_literal: true

class Book < ApplicationRecord
  LATEST_BOOK_COUNT = 4
  NEW_BOOKS_COUNT = 3

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :category_books, dependent: :destroy
  has_many :categories, through: :category_books

  accepts_nested_attributes_for :author_books, allow_destroy: true
  accepts_nested_attributes_for :category_books, allow_destroy: true
  # accepts_nested_attributes_for :authors, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

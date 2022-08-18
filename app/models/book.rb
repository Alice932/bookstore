# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author

  LATEST_BOOK_COUNT = 4
  NEW_BOOKS_COUNT = 3

  validates :title, presence: true
  validates :description, presence: true
  validates :author_id, presence: true
  validates :price, presence: true
end

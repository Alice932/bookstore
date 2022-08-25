# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_books, dependent: :destroy
  has_many :books, through: :category_books

  validates :category_name, presence: true
end

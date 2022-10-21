# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :category_books, dependent: :destroy
  has_many :categories, through: :category_books
  has_many :reviews, dependent: :destroy
  has_many :book_photos, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  accepts_nested_attributes_for :book_photos, allow_destroy: true
  accepts_nested_attributes_for :author_books, allow_destroy: true
  accepts_nested_attributes_for :category_books, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

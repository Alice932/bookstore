# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books

  validates :first_name, presence: true
  validates :last_name, presence: true

  def display_name
    "#{first_name} #{last_name}"
  end
end

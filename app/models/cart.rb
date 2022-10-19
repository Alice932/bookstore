# frozen_string_literal: true

class Cart < ApplicationRecord
  enum status: { unprocessed: 0, delivered: 1, canceled: 2 }
  belongs_to :user, optional: true

  has_many :cart_books, dependent: :destroy
  has_many :books, through: :cart_books, dependent: :destroy
  has_one :coupon, dependent: :destroy
end

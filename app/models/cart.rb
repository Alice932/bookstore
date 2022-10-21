# frozen_string_literal: true

class Cart < ApplicationRecord
  enum status: { empty: 0, filled: 1 }
  belongs_to :user, optional: true

  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items, dependent: :destroy
  has_one :coupon, dependent: :destroy
end

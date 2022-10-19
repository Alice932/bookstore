# frozen_string_literal: true

class CartBook < ApplicationRecord
  belongs_to :cart
  belongs_to :book

  validates :quantity, presence: true
end

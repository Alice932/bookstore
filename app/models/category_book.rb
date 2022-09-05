# frozen_string_literal: true

class CategoryBook < ApplicationRecord
  belongs_to :category
  belongs_to :book
end

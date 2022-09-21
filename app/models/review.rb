# frozen_string_literal: true

class Review < ApplicationRecord
  validates :score, numericality: { in: 0..5 }
  validates :title, presence: true
  validates :review_text, presence: true
end

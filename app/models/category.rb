# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_courses, dependent: :destroy
  has_many :courses, through: :category_courses

  validates :name, presence: true
end

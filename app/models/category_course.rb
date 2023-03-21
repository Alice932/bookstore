# frozen_string_literal: true

class CategoryCourse < ApplicationRecord
  belongs_to :category
  belongs_to :course
end

# frozen_string_literal: true

class Coach < ApplicationRecord
  has_many :coach_courses, dependent: :destroy
  has_many :course, through: :coach_courses

  validates :first_name, presence: true
  validates :last_name, presence: true
end

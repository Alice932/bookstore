# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :coach_courses, dependent: :destroy
  has_many :coaches, through: :coach_courses
  has_many :category_courses, dependent: :destroy
  has_many :categories, through: :category_courses
  has_many :reviews, dependent: :destroy
  has_many :course_photos, dependent: :destroy
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :course_photos, allow_destroy: true
  accepts_nested_attributes_for :coach_courses, allow_destroy: true
  accepts_nested_attributes_for :category_courses, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

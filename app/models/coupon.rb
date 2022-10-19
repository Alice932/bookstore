# frozen_string_literal: true

class Coupon < ApplicationRecord
  enum status: { active: 0, used: 1, inactive: 2 }
  belongs_to :cart, optional: true

  validates :code, presence: true, uniqueness: true
  validates :discount, presence: true
end

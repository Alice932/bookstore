# frozen_string_literal: true

class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :author
  validates_presence_of :price
end

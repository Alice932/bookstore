# frozen_string_literal: true

class CoachCourse < ApplicationRecord
  belongs_to :coach
  belongs_to :course
end

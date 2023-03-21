# frozen_string_literal: true

class CoursePhoto < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :course
end

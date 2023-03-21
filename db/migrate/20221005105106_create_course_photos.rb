# frozen_string_literal: true

class CreateCoursePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :course_photos do |t|
      t.references :course, foreign_key: true
      t.text       :image_data
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateCoachCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :coach_courses do |t|
      t.belongs_to :coach, foreign_key: true, null: false
      t.belongs_to :course, foreign_key: true, null: false

      t.timestamps
    end
  end
end

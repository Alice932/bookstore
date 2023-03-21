# frozen_string_literal: true

class CreateCategoryCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :category_courses do |t|
      t.belongs_to :course, foreign_key: true, null: false
      t.belongs_to :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end

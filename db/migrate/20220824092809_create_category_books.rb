# frozen_string_literal: true

class CreateCategoryBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :category_books do |t|
      t.belongs_to :book, foreign_key: true, null: false
      t.belongs_to :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end

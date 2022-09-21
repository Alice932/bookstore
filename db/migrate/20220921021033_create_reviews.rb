# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :score, min: 0, max: 5, default: 0
      t.string :title, null: false
      t.string :review_text, null: false
      t.timestamps
    end
  end
end

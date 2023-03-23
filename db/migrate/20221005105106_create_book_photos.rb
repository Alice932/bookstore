# frozen_string_literal: true

class CreateBookPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :book_photos do |t|
      t.references :book, foreign_key: true
      t.text       :image_data
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateAuthorBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :author_books do |t|
      t.belongs_to :author, foreign_key: true, null: false
      t.belongs_to :book, foreign_key: true, null: false

      t.timestamps
    end
  end
end

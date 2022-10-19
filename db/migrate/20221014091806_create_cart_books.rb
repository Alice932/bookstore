# frozen_string_literal: true

class CreateCartBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_books do |t|
      t.integer :quantity, default: 1, null: false
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.timestamps
    end
  end
end

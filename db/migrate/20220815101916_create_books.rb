# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end

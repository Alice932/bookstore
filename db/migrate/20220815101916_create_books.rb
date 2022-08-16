# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author
      t.integer :price
      t.integer :sales_count
      t.timestamps
    end
  end
end

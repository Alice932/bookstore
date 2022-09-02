# frozen_string_literal: true

class AddBookParams < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.string :publication_date, null: false
      t.string :materials, null: false
      t.string :dimensions, null: false
    end
  end
end

# frozen_string_literal: true

class AddBookParams < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.string :publication_date, null: false, default: ''
      t.string :materials, null: false, default: ''
      t.string :dimensions, null: false, default: ''
    end
  end
end

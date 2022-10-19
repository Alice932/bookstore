# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :status, default: 0, null: false
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
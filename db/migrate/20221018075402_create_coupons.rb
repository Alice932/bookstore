# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.integer :status, default: 0, null: false
      t.string :code, null: false, unique: true
      t.float :discount, null: false
      t.belongs_to :cart, foreign_key: true, index: { unique: true }
      t.timestamps
    end
  end
end

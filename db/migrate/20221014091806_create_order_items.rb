# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity, default: 1, null: false
      t.belongs_to :order, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.timestamps
    end
  end
end

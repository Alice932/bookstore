# frozen_string_literal: true

class AddUniqNumber < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :number, :string, null: true, unique: true
  end
end

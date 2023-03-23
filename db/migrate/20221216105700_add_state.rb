# frozen_string_literal: true

class AddState < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :state, :integer, default: 0, null: false
  end
end

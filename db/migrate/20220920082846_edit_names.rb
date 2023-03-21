# frozen_string_literal: true

class EditNames < ActiveRecord::Migration[7.0]
  def change
    change_table :coaches do |t|
      t.rename :name, :first_name
      t.string :last_name, null: false
      t.string :description, default: ''
    end
    change_table :categories do |t|
      t.rename :category_name, :name
    end
  end
end

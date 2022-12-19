# frozen_string_literal: true

class DeliveryToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :delivery, index: true, foreign_key: true
  end
end

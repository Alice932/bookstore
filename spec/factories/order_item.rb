# frozen_string_literal: true

FactoryBot.define do
  factory(:order_item) do
    order
    book
    quantity { FFaker::Random.rand(1..3) }
  end
end

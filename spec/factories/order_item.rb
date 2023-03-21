# frozen_string_literal: true

FactoryBot.define do
  factory(:order_item) do
    order
    course
    quantity { FFaker::Random.rand(1..3) }
  end
end

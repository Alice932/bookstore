# frozen_string_literal: true

FactoryBot.define do
  factory(:cart_book) do
    cart
    book
  end
end

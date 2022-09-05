# frozen_string_literal: true

FactoryBot.define do
  factory(:category_book) do
    category
    book
  end
end

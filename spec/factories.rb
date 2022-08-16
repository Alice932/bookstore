# frozen_string_literal: true

FactoryBot.define do
  factory(:book) do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    author { FFaker::Book.author }
    price { FFaker::Number.number }
    sales_count { FFaker::Number.number }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory(:book) do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    author_id { 1 }
    price { FFaker::Number.number }
  end

  factory(:author) do
    name { FFaker::Book.author }
  end
end

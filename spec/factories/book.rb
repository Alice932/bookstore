# frozen_string_literal: true

FactoryBot.define do
  factory(:book) do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    price { FFaker::Number.number }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory(:course) do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    price { FFaker::Random.rand(100) }
    publication_date { FFaker::Vehicle.year }
    materials { FFaker::Product.product }
    dimensions { FFaker::Lorem.words }
  end
end

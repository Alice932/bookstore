# frozen_string_literal: true

FactoryBot.define do
  factory(:review) do
    score { FFaker::Random.rand(5) }
    title { FFaker::Lorem.word }
    name { FFaker::Name.first_name }
    review_text { FFaker::Book.description }
    user
    book
  end
end

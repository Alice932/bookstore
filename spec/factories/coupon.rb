# frozen_string_literal: true

FactoryBot.define do
  factory(:coupon) do
    code { FFaker::Code.npi }
    discount { FFaker::Random.rand(50) }
    trait :status do
      status { status }
    end
  end
end

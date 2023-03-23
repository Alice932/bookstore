# frozen_string_literal: true

FactoryBot.define do
  factory :delivery do
    name { FFaker::Name.first_name }
    price { FFaker::Random.rand(100) }
    from_date { FFaker::Random.rand(2..10) }
    to_date { FFaker::Random.rand(2..10) }

    trait :orders do
      [order]
    end
  end
end

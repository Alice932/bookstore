# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    name { FFaker::Bank.card_type.delete('_') }
    number { FFaker::Bank.card_number.delete(' ') }
    date { FFaker::Bank.card_expiry_date }
    cvv { FFaker::PhoneNumber.area_code }

    trait :order do
      order
    end
  end
end

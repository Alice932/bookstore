# frozen_string_literal: true

FactoryBot.define do
  factory(:coach) do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    description { FFaker::Lorem.phrase }
  end
end

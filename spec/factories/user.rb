# frozen_string_literal: true

FactoryBot.define do
  factory(:user) do
    email { "#{FFaker::Lorem.word}@gmail.com" }
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { Time.now }
  end
end

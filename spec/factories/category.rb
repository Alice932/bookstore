# frozen_string_literal: true

FactoryBot.define do
  factory(:category) do
    category_name { FFaker::Book.genre }
  end
end

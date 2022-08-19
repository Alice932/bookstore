# frozen_string_literal: true

FactoryBot.define do
  factory(:author_book) do
    author_id { author_id }
    book_id { book_id }
  end
end

# frozen_string_literal: true

i = 0
3.times do
  Author.create({ name: FFaker::Book.author })
end

5.times do
  Book.create({ title: FFaker::Book.title,
                description: FFaker::Book.description,
                price: FFaker::Number.number })
end

5.times do
  AuthorBook.create({ author_id: rand(1..3), book_id: i += 1 })
end

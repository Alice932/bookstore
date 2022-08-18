# frozen_string_literal: true

5.times do
  Book.create({ title: FFaker::Book.title,
                description: FFaker::Book.description,
                author_id: rand(1..3),
                price: FFaker::Number.number })
end

3.times do
  Author.create({ name: FFaker::Book.author })
end

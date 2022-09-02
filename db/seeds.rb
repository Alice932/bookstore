# frozen_string_literal: true

15.times do
  Book.create({ title: FFaker::Book.title,
                description: FFaker::Book.description(8),
                price: FFaker::Random.rand(100),
                publication_date: FFaker::Vehicle.year,
                materials: 'H:6.4\" x W: 0.9\" x D: 5.0',
                dimensions: FFaker::Lorem.words })
end

15.times do
  Author.create({ name: FFaker::Book.author })
end

i = 1
15.times do
  AuthorBook.create({ book_id: i, author_id: i })
  i += 1
end

Category.create({ category_name: 'Mobile Development' })
Category.create({ category_name: 'Photo' })
Category.create({ category_name: 'Web Design' })
Category.create({ category_name: 'Web Development' })

j = 1
15.times do
  CategoryBook.create({ book_id: j, category_id: rand(1..4) })
  j += 1
end

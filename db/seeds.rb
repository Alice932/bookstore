# frozen_string_literal: true

15.times do
  Book.create({ title: FFaker::Book.title,
                description: FFaker::Book.description(8),
                price: FFaker::Random.rand(100),
                publication_date: FFaker::Vehicle.year,
                materials: FFaker::Lorem.words,
                dimensions: 'H:6.4\" x W: 0.9\" x D: 5.0' })
end

15.times do
  Author.create({ first_name: FFaker::Name.first_name,
                  last_name: FFaker::Name.last_name,
                  description: FFaker::Lorem.phrase })
end

i = 1
15.times do
  AuthorBook.create({ book_id: i, author_id: i })
  i += 1
end

Category.create({ name: 'Mobile Development' })
Category.create({ name: 'Photo' })
Category.create({ name: 'Web Design' })
Category.create({ name: 'Web Development' })

j = 1
15.times do
  CategoryBook.create({ book_id: j, category_id: rand(1..4) })
  j += 1
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

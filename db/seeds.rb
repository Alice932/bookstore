# frozen_string_literal: true

15.times do
  Course.create({ title: FFaker::Company.catch_phrase,
                  description: FFaker::Book.description(8),
                  price: FFaker::Random.rand(100)})
end

15.times do
  Coach.create({ first_name: FFaker::Name.first_name,
                 last_name: FFaker::Name.last_name,
                 description: FFaker::Company.position })
end

i = 1
15.times do
  CoachCourse.create({ course_id: i, coach_id: i })
  i += 1
end

Category.create({ name: 'Mobile Development' })
Category.create({ name: 'Photo' })
Category.create({ name: 'Web Design' })
Category.create({ name: 'Web Development' })

j = 1
15.times do
  CategoryCourse.create({ course_id: j, category_id: rand(1..4) })
  j += 1
end

AdminUser.create!(email: 'admin@example.com', password: 'password',
                  password_confirmation: 'password')

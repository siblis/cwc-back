# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

8.times do
  Project.create({
    title: Faker::Hacker.say_something_smart,
    body: Faker::Lorem.paragraph,
    completed: false,
    deadline: Faker::Date.forward(rand(60)+20),
    started: Faker::Date.backward(rand(30))
  })
end

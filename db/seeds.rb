# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
  user = User.create(
    login: Faker::Internet.username,
    password: Faker::Internet.password,
    email: Faker::Internet.email,
    deleted: false,
    admin: false
  )

  8.times do
    project = user.projects.create(
      title: Faker::Hacker.say_something_smart,
      body: Faker::Lorem.paragraph,
      completed: false,
      deadline: Faker::Date.forward(rand(60)+20),
      started: Faker::Date.backward(rand(30))
    )
    8.times do
      task = project.tasks.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::Lorem.paragraph,
        completed: false,
        user_id: user.id,
        deadline: Faker::Date.forward(rand(60)+20),
        started: Faker::Date.backward(rand(30))
      )
      4.times do
        task.comments.create(
          body: Faker::Lorem.paragraph,
          user_id: user.id
        )
      end
    end
  end
end

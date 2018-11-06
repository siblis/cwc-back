# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
projects = Project.create(
  [
    {
      title: "A new cake recipe",
      body: "Made of chocolate",
      completed: false,
      deadline: Time.new + (rand(60)+10)*86400 + rand(24)*3600
    },
    {
      title: "A twitter client idea",
      body: "Only for replying to mentions and DMs",
      completed: false,
      deadline: Time.new + (rand(60)+10)*86400 + rand(24)*3600
    },
    {
      title: "A novel set in Italy",
      body: "A mafia crime drama starring Berlusconi",
      completed: false,
      deadline: Time.new + (rand(60)+10)*86400 + rand(24)*3600
    },
    {
      title: "Card game design",
      body: "Like Uno but involves drinking",
      completed: false,
      deadline: Time.new + (rand(60)+10)*86400 + rand(24)*3600
    }
  ])
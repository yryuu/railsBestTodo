# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "yryuuyamazaki@example.co.jp",
             password:              "yryuuyamazaki",
             password_confirmation: "yryuuyamazaki")

99.times do |n|
  name  = Faker::Name.name
  email = "yryuuyamazaki-#{n+1}@example.co.jp"
  password = "yryuuyamazaki"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.todos.create!(content: content) }
end
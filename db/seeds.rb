# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'malotor', email: 'malotor@gmail.com', admin: true, password: 'test')
User.create(username: 'tester', email: 'tester@test.com', admin: false, password: 'test')

Article.create(title: "An article title", description: "An article description", user: User.first)

Category.create(name: 'Sports')
Category.create(name: 'Food')
Category.create(name: 'Programming')
Category.create(name: 'Travel')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email: 'admin@gmail.com', password: 'dayana')
user1.add_role :admin

user2 = User.create(email: 'doctor@gmail.com', password: 'doctor')
user2.add_role :doctor
puts "created"
p User.all.count
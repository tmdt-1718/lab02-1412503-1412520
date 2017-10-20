# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(email: 'thikhin96@yahoo.com', password_digest: '123', name: 'thikhin96')

User.create!(email: 'thanh@gmail.com', password: '123', name: 'thanh')
User.create!(email: 'hoang@yahoo.com', password: '123', name: 'hoang')
User.create!(email: 'giang@gmail.com', password: '123', name: 'giang')

Friend.create!(user_id: 1, friend_id: 2)
Friend.create!(user_id: 1, friend_id: 3)
Friend.create!(user_id: 1, friend_id: 4)


Message.create!(content: 'hô hô hô', sender_id: 2, senttime: Time.now)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |n|
  name = Faker::Name.name
  email = "test-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
  end
  
  User.create!(name: "佐藤健",
    email: "general@example.com",
    password: "foobaz",
    password_confirmation: "foobaz")
    
  User.create!(name: "管理ユーザー",
    email: "k.uneune0703@gmail.com",
  admin: true,
  password: "pmhkiy",
  password_confirmation: "pmhkiy"
  )

users = User.order(:created_at).take(6)
10.times do 
# アニメタイトル
title = Faker::Movie.title

users.each {|user| user.posts.create!(title: title) }
end

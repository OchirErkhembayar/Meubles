# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "creating 30 users"

user_array = []

30.times do
  user = User.new(
    email: "#{Faker::Name.first_name}@doop.com",
    password: 123123
  )
  user.save!
  user_array << user
end

puts " users created"

puts "5 categories being made"

category_array = []

category = Category.create!(name: "old")
category_array << category
category = Category.create!(name: "new")
category_array << category
category = Category.create!(name: "big")
category_array << category
category = Category.create!(name: "small")
category_array << category
category = Category.create!(name: "modern")
category_array << category

puts "5 categories made"

puts "30 furnitures being created and assigned to user and category"

furniture_array = []

30.times do
  user_id = user_array.sample.id
  furniture = Furniture.new(
    name: Faker::House.furniture,
    location: Faker::Address.full_address,
    price: (1..100).to_a.sample,
    user_id: user_id,
    category_id: category_array.sample.id,
    description: "A wonderful piece of furniture wow! Such amazing quality! Such cheap price! Amazing! Wow!"
  )
  user_array.reject { |user| user.id == user_id }
  furniture.save!
  furniture_array << furniture
end

puts "30 furnitures created"

puts "creating 20 offers"

20.times do
  offer = Offer.new(
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 23),
    furniture_id: furniture_array.sample.id,
    user_id: user_array.sample.id
  )
  offer.save!
end

puts "20 offers created!"

puts "seeding done"

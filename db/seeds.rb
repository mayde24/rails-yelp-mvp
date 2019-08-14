# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all

categories = ["chinese", "italian", "japanese", "french", "belgian"]
10.times do
  resto = Restaurant.new(name: Faker::Artist.name, phone_number: Faker::Number.number(digits: 10), address: Faker::Address.full_address, category: categories[rand(0...4)])
  rand(5...15).times do
    rev = Review.new(content: Faker::Lorem.sentence, rating: rand(0...5), restaurant: resto)
    rev.save
  end
  resto.save
end

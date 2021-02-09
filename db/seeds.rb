# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seed...."

gillis = User.create!(email: "gillis@mail.com", password: "123456")

Surfboard.create!(name: "X-5000", details: "Rent my pro board now", price: 15,
  available: "Yes", location: "Venice Beach", user: gillis)

Surfboard.create!(name: "Oklay", details: "I got sick surfboard you can rent", price: 13,
  available: "Yes", location: "Miami Beach", user: gillis)

Surfboard.create!(name: "Nike Boost", details: "Rent a perfect beginner board", price: 10,
  available: "No", location: "Barcelona Beach", user: gillis)

Surfboard.create!(name: "Le Wagon", details: "Surf like you surf the web, super-easy", price: 19,
  available: "Yes", location: "Shorditch cannel", user: gillis)

Surfboard.create!(name: "Quicksilver Madness", details: "Advanced surfboard for pros", price: 25,
  available: "No", location: "Tulum Beach", user: gillis)

puts "seeding done!"

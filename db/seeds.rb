# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seed...."

Gillis = User.create!(email: "gillis12@mail.com", password: "123456")
Roberto = User.create!(email: "roberto12@mail.com", password: "123456")

Surfboard.create!(name: "X-5000", details: "Rent my pro board now", price: 15,
  available: true, location: "Venice Beach", user: Gillis)

Surfboard.create!(name: "Oklay", details: "I got a sick surfboard you can rent", price: 13,
  available: true, location: "Miami Beach", user: Gillis)

Surfboard.create!(name: "Nike Boost", details: "Rent a perfect beginner board", price: 10,
  available: false, location: "Barcelona Beach", user: Roberto)

Surfboard.create!(name: "Le Wagon", details: "Surf like you surf the web, super-easy", price: 19,
  available: true, location: "Shorditch Canal", user: Roberto)

Surfboard.create!(name: "Quicksilver Madness", details: "Advanced surfboard for pros", price: 25,
  available: false, location: "Tulum Beach", user: Roberto)


puts "seeding done!"

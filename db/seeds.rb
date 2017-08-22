# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Drone.destroy_all
Rental.destroy_all

puts 'Creating a unique fake user...'
20.times do
  user = User.new(
    email: Faker::Internet.safe_email,
    password: "blblabla5x4548",
    first_name: Faker::GameOfThrones.character,
    zip_code: 13006
  )
 user.save!
end
puts 'Drones Finished!'

puts 'Creating 20 fake drones...'
40.times do
  drone = Drone.new(
    user_id: 1,
    brand: Faker::Business.credit_card_type,
    model: Faker::Vehicle.manufacture,
    daily_price:  20,
    weekly_deal:  80,
    monthly_deal:   250,
    available:  true,
    autonomy: 50,
    range: 2000,
    controller: true,
    deposit: 780,
    description: Faker::HowIMetYourMother.quote
  )

  drone.user = User.first

 drone.save!
end
puts 'Drones Finished!'


puts 'Creating 20 fake rentals...'
20.times do
  rental = Rental.new(
    start_date: 170917,
    end_date: 190817,
    user_id: 1,
    drone_id: Random.new.rand(1..40),
    total_price: 1000
  )
  rental.user = User.last
  rental.drone = Drone.first
  rental.save!
end
puts 'rentals Finished!'


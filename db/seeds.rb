# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts "Cleaning database..."
User.destroy_all
puts "Creating users..."
5.times do
  user = User.new(
    username: Faker::Internet.username ,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
end
puts "Finished with the users creation!"



puts "Cleaning database..."
Instrument.destroy_all
puts "Creating instruments..."
3.times do
  full_address = Faker::Address.full_address
  category = Faker::Music.instrument
  instrument = Instrument.new(
    user_id: User.first.id,
     pickup_address: full_address,
    category: category,
    price_per_day: rand(10..60),
    description: "Awesome " + category,
    title: category
  )
  instrument.save!
end

2.times do
  full_address = Faker::Address.full_address
  category = Faker::Music.instrument
  instrument2 = Instrument.new(
    user_id: User.last.id,
    pickup_address: full_address,
    category: category,
    price_per_day: rand(10..60),
    description: "Awesome " + category,
    title: category
    )
  instrument2.save!
end
# puts "Finished with the ingredients creation!"

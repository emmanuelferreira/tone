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
puts "Creating 1 user..."
user = User.new(
  username: "emmanuel19",
  email: "emmanuel@gmail.com",
  password: '123456'
)
  user.save!
puts "Finished with the user creation!"


puts "Cleaning database..."
Instrument.destroy_all
puts "Creating instruments..."

5.times do
  category = ["guitar", "piano", "flute", "bass"].sample()
  full_address = ["Avenue des Boveresses 42, 1010 Lausanne", "Place de la Palud 2 1002 Lausanne ", "Avenue de la Gare 46 1022 Chavannes-près-Renens"].sample()
  word = ["Rent", "Awesome", "Great"].sample
  instrument = Instrument.new(
    user_id: User.first.id,
    pickup_address: full_address,
    category: category,
    price_per_day: rand(10..60),
    description: "An ideal #{category} for students and beginners.
An excellent value in #{category}, Squier's Affinity Series are ideal for players who are just getting started, with solid construction and electronics. This Affinity Series Telecaster provides all the you want from a Tele, along with a smooth-playing Indian laurel fretboard and the ease and convenience of a top-loading bridge. Now available in this limited-edition finish. Case sold separately. Start with a real Telecaster. Order your special-edition Affinity Tele today.",
    title: "#{word} #{category.capitalize} "
  )

  instrument.save!
end




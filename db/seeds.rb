# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts "Cleaning database..."
Booking.destroy_all
User.destroy_all



puts "Creating 1 user..."
user = User.new(
  username: "emmanuel19",
  email: "emmanuel@gmail.com",
  password: '123456'
)
  user.save!
puts "Finished with the user 1 creation!"

puts "Creating 1 user..."
user = User.new(
  username: "morgan",
  email: "morgan@gmail.com",
  password: '123456'
)
  user.save!
puts "Finished with the user 1 creation!"


puts "Creating instruments..."
  instrument = Instrument.new(
    user_id: User.first.id,
    pickup_address: "Rue de Lausanne 40, Renens, Vaud, Suisse",
    category: "guitar",
    price_per_day: 10,
    description: "An ideal guitar for students and beginners.
                  An excellent value in guitar, Squier's Affinity Series are ideal
                  for players who are just getting started, with solid construction and electronics.
                  This Affinity Series Telecaster provides all the you want from a Tele,
                  along with a smooth-playing Indian laurel fretboard and the ease and
                  convenience of a top-loading bridge. Now available in this limited-edition finish.
                  Case sold separately. Start with a real Telecaster. Order your special-edition Affinity Tele today.",
    title: "Best guitar for beginners",
    img_url: "https://images.unsplash.com/photo-1514649923863-ceaf75b7ec00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
  )

  instrument.save!


booking = Booking.new(
  instrument_id: Instrument.first.id,
  user_id:  User.last.id,
  check_in_date: Date.today - 15,
  check_out_date: Date.today - 12,
  rental_price_total: 30,
  status: 'accepted'
)
booking.save!

booking = Booking.new(
  instrument_id: Instrument.first.id,
  user_id:  User.last.id,
  check_in_date: Date.today + 5,
  check_out_date: Date.today + 17,
  rental_price_total: 120,
  status: 'pending'
)
booking.save!




puts "Creating instruments..."
  instrument = Instrument.new(
    user_id: User.last.id,
    pickup_address: "Rue de Genève, Lausanne, Vaud, Suisse",
    category: "flute",
    price_per_day: 20,
    description: "An ideal flute for students and beginners.
An excellent value in flute, Squier's Affinity Series are ideal for players who are just getting started, with solid construction and electronics. This Affinity Series Telecaster provides all the you want from a Tele, along with a smooth-playing Indian laurel fretboard and the ease and convenience of a top-loading bridge. Now available in this limited-edition finish. Case sold separately. Start with a real Telecaster. Order your special-edition Affinity Tele today.",
    title: "Enchanté to rent my awesome flute ",
    img_url: "https://images.unsplash.com/photo-1567184406952-9f6ba54cb614?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
  )

  instrument.save!

  booking = Booking.new(
  instrument_id: Instrument.last.id,
  user_id:  User.first.id,
  check_in_date: Date.today + 2,
  check_out_date: Date.today + 4,
  rental_price_total: 40,
  status: 'accepted'
)
booking.save!

puts "Done seeding"

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
  username: "emmanuel",
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
    user_id: User.find_by(email: "emmanuel@gmail.com").id,
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
    user_id: User.find_by(email: "morgan@gmail.com").id,
    pickup_address: "Rue de Genève, Lausanne, Vaud, Suisse",
    category: "flute",
    price_per_day: 20,
    description: "An ideal flute for students and beginners.
An excellent value in flute, Squier's Affinity Series are ideal for players who are just getting started, with solid construction and electronics. This Affinity Series Telecaster provides all the you want from a Tele, along with a smooth-playing Indian laurel fretboard and the ease and convenience of a top-loading bridge. Now available in this limited-edition finish. Case sold separately. Start with a real Telecaster. Order your special-edition Affinity Tele today.",
    title: "Awesome flute ",
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

# ***************************************************************************** ajouts JD


user = User.new(
  username: "vincent",
  email: "vincent@gmail.com",
  password: '123456'
)
  user.save!

user = User.new(
  username: "paul",
  email: "paul@gmail.com",
  password: '123456'
)
  user.save!

  user = User.new(
  username: "john",
  email: "john@gmail.com",
  password: '123456'
)
  user.save!

  user = User.new(
  username: "ringo",
  email: "ringo@gmail.com",
  password: '123456'
)
  user.save!

  user = User.new(
  username: "simon",
  email: "simon@gmail.com",
  password: '123456'
)
  user.save!

  user = User.new(
  username: "lewis",
  email: "lewis@gmail.com",
  password: '123456'
)
  user.save!

  instrument = Instrument.new(
    user_id: User.find_by(email: "emmanuel@gmail.com").id,
    pickup_address: "Chemin de Fontenay, Lausanne, Vaud, Suisse",
    category: "microphone",
    price_per_day: 20,
    description: "The Bird UM1 is a top quality studio microphone featuring a built-in USB interface. This is a perfect, all-in-one solution that will save you the additional cost of a preamp or of an audio interface.",
    title: "Come to rent my awesome microphone ",
    img_url: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email: "morgan@gmail.com").id,
    pickup_address: "Avenue Marc-Dufour, Lausanne, Vaud, Suisse",
    category: "microphone",
    price_per_day: 30,
    description: "The UM30 is an excellent quality studio microphone with built-in USB interface. It is the perfect and all-in-one solution which will spare you the trouble of having to buy an additional preamp or audio interface.",
    title: "microphone!!!! ",
    img_url: "https://images.unsplash.com/photo-1563726351554-179049599895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email: "vincent@gmail.com").id,
    pickup_address: "Chemin de Contigny, Lausanne, Vaud, Suisse",
    category: "microphone",
    price_per_day: 10,
    description: "Audio Technica AT2020 brings a new standard of performance and quality to condenser studio microphones at this price point. Its low mass diaphragm is custom made for extended frequency response and superior transient response. With very low intrinsic noise, it is perfectly suited to today's digital recording equipment. This microphone offers extended dynamics and easily holds high sound pressure levels. Its robust construction is designed to last for years.",
    title: "Enchanté to rent my awesome microphone ",
    img_url: "https://images.unsplash.com/photo-1565078406442-c1749e35d5ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email: "paul@gmail.com").id,
    pickup_address: "Avenue du Vélodrome, Lausanne, Vaud, Suisse",
    category: "microphone",
    price_per_day: 40,
    description: "The Samson Satellite microphone is designed for recording high definition 24/96 kHz on your computer, iPhone or iPad. Designed for podcast and live streaming, it offers players and creators of online content three selectable directivities, a headphone without latency, a switch to mute the microphone on the fly, and a patented system of folding feet in an ultraportable case.",
    title: "An ideal microphone for studio",
    img_url: "https://images.unsplash.com/photo-1586462459390-459a7c7e960c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email:"simon@gmail.com").id,
    pickup_address: "Chemin du Marronnier, Lausanne, Vaud, Suisse",
    category: "microphone",
    price_per_day: 20,
    description: "The Samson Satellite microphone is designed for recording high definition 24/96 kHz on your computer, iPhone or iPad. Designed for podcast and live streaming, it offers players and creators of online content three selectable directivities, a headphone without latency, a switch to mute the microphone on the fly, and a patented system of folding feet in an ultraportable case.",
    title: "Cool microphone for beginners ",
    img_url: "https://images.unsplash.com/photo-1505949842063-0f8a621ba848?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email:"lewis@gmail.com").id,
    pickup_address: "Rue Voltaire, Lausanne, Vaud, Suisse",
    category: "microphone",
    price_per_day: 30,
    description: "The figures speak for themselves: the NT1 displays a clean noise of only 4.5dBA! The microphone body is machined from 6061 aluminum and then nickel plated to resist corrosion. The topcoat is made of durable, military grade ceramic, using advanced electrostatic application techniques, developed by RØDE to ensure an extremely hard finish, resistant to scratches and bumps. The NT1 is supplied with the new RØDE SMR suspension. With a unique Double Lyre suspension system, the SMR cancels external mechanical vibrations and noise and enhances the effect of the Rycote Lyre system by using a smaller internal Lyre system as a tension element. Each Lyre system is thus kept in a neutral position where it is most effective in canceling vibrations. The removable pop filter in the SMR suspension is made entirely of metal and has rock solid durability. Easily washable, it is as efficient as it looks and considerably reduces the noise of the plosives.",
    title: "Perfect microphone",
    img_url: "https://images.unsplash.com/photo-1581650127213-e72e2271ff15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email:"ringo@gmail.com").id,
    pickup_address: "Avenue de Rosemont, Lausanne, Vaud, Suisse",
    category: "saxophone",
    price_per_day: 10,
    description: "Already a legend, the attained the love and respect of a wide range of players for its highly reliable performance and outstanding quality. It owes its success to a group of dedicated designers with great vision, and highly skilled craftsmen performing their work with an extraordinary level of devotion, perfection, and passion.",
    title: "Best saxophone for beginners",
    img_url: "https://images.unsplash.com/photo-1587832280949-6d29bc405db1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email:"simon@gmail.com").id,
    pickup_address: "Avenue d'Echallens, Prilly, Vaud, Suisse",
    category: "saxophone",
    price_per_day: 40,
    description: "The YAS-480 saxophones are a step ahead. With a little bit more resistance, they have an authoritative sound yet a great flexibility due to the separated key guards.",
    title: "Sex is Sax!",
    img_url: "https://images.unsplash.com/photo-1590555652051-4cc63f7c860c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email: "lewis@gmail.com").id,
    pickup_address: "Chemin de Bon-Abri, Lausanne, Vaud, Suisse",
    category: "saxophone",
    price_per_day: 50,
    description: "The Julius Keilwerth MKX Series marks the next evolution of the saxophone for this historic brand. By combining tonal characteristics of the legendary SX90R along with physical characteristics reminiscent of vintage saxophones, the MKX Series allows the player to have the best of both worlds; a modern sound with a vintage feel.",
    title: "Amazing saxophone",
    img_url: "https://images.unsplash.com/photo-1566454108377-77a89ec31134?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  puts "Creating instruments..."
  instrument = Instrument.new(
    user_id: User.find_by(email: "vincent@gmail.com").id,
    pickup_address: "Chemin des Clochetons, Lausanne, Vaud, Suisse",
    category: "guitar",
    price_per_day: 30,
    description: "If you're a beginning guitar player, the best choice you can make is getting a guitar with a sound and feel that will inspire you to keep playing. The CD-60 is a genuine Fender that is affordable and comes in three great-looking finishes to match your style. It provides nicely balanced tone and plenty of volume thanks to its dreadnought body style and spruce top with scalloped bracing. The CD-60 is also an excellent choice for veteran players who need an inexpensive second dreadnought model.",
    title: "Enchanté to rent my guitar ",
    img_url: "https://images.unsplash.com/photo-1516924962500-2b4b3b99ea02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  puts "Creating instruments..."
  instrument = Instrument.new(
    user_id: User.find_by(email: "paul@gmail.com").id,
    pickup_address: "Rue de la Tour, Lausanne, Vaud, Suisse",
    category: "guitar",
    price_per_day: 40,
    description: "the CD-140SCE All-Mahogany completes the features of its little sister with a new Fishman® Presys electronics, a mahogany construction, as well as a hard case. This single cutaway Dreadnought guitar features a solid mahogany table which gives it a robust sound. In addition, its comfortable neck is suitable for all styles of play. The CD-140SCE All-Mahogany is decorated with a Tortoise Shell protection plate and a mahogany veneer on the head of the neck. Whether you are at home or on stage, it is suitable for all situations. ",
    title: "Awesome guitar! ",
    img_url: "https://images.unsplash.com/photo-1528553744039-c1dcef33574f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  puts "Creating instruments..."
  instrument = Instrument.new(
    user_id: User.find_by(email: "john@gmail.com").id,
    pickup_address: "Rue de la Vigie, Lausanne, Vaud, Suisse",
    category: "guitar",
    price_per_day: 50,
    description: "The GN75CE provides everything you need to play on stage and at home. Featuring a solid spruce top and a dappled maple back and splints that produce a rich and precise sound, this beautiful acoustics also provides excellent playing comfort thanks to its mahogany neck and his touch of rosewood. The TK-4TD preamp, which includes a tuner, a three-band equalizer and a gain control, offers a versatility and unprecedented sound quality. ",
    title: "The perfect guitar ever",
    img_url: "https://images.unsplash.com/photo-1528201907966-756e7e4c5a18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  puts "Creating instruments..."
  instrument = Instrument.new(
    user_id: User.find_by(email: "ringo@gmail.com").id,
    pickup_address: "Chemin des Retraites, Lausanne, Vaud, Suisse",
    category: "guitar",
    price_per_day: 40,
    description: "The table, back and sides of this new guitar are made of composite (HPL) with a magnificent Koa motif generated from premium Hawaiian Koa specially selected from our Martin wood reserves. This guitar is fitted with Fishman® MX electronics and mounted with Martin Authentic Acoustic Lifespan® 2.0 strings. All this gives the D-X1E Koa a beautiful aesthetic that matches its powerful sound. Add to that a new soft padded cover with head, bridge and strap attachments, as well as a durable water repellant exterior, and this model truly becomes a guitar ready for the stage. ",
    title: "guitar hero!",
    img_url: "https://images.unsplash.com/photo-1508081444780-e2ea2f0b4754?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!
  instrument = Instrument.new(
    user_id: User.find_by(email: "john@gmail.com").id,
    pickup_address: "Chemin des Avelines, Lausanne, Vaud, Suisse",
    category: "piano",
    price_per_day: 70,
    description: "This is a beautiful instrument made to last! It has all the necessary features to fully enjoy playing the piano live or in the studio.",
    title: "piano for lover",
    img_url: "https://images.unsplash.com/photo-1576487236230-eaa4afe9b453?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
  )
  instrument.save!

  booking = Booking.new(
  instrument_id: Instrument.find_by(title: "The perfect guitar ever").id,
  user_id:  User.first.id,
  check_in_date: Date.today + 4,
  check_out_date: Date.today + 13,
  rental_price_total: 30,
  status: 'pending'
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



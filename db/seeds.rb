require "open-uri"

Booking.destroy_all

puts "Cleaning database..."
Van.destroy_all

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
user1 = { first_name: "Jane", last_name: "Doe", email: "123@mail.com", password: "123456" }
user2 = { first_name: "John", last_name: "Doe", email: "456@mail.com", password: "123456" }
user3 = { first_name: "Jessica", last_name: "Smith", email: "789@mail.com", password: "123456" }
user4 = { first_name: "Joel", last_name: "Moreno", email: "1011@mail.com", password: "123456" }
user5 = { first_name: "Janet", last_name: "Lopez", email: "1213@mail.com", password: "123456" }
user6 = { first_name: "Jerome", last_name: "Dupont", email: "1415@mail.com", password: "123456" }

[user1, user2, user3, user4, user5, user6].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end
puts "Finished!"

#Seed vans

puts "Creating vans..."

tincan = {
  title: "Special retro Volkswagen bus",
  price: 125,
  description: "With a design that recalls Volkswagen's iconic first camper vans,
  the VW California is a modern symbol of independence and freedom. It is a versatile
  camper van that is fully fitted and has a pop-up roof. It travels up to five people.
  The interior has swivel chairs and a rear seat that retracts to make space for a
  stowaway table or folds into a double bed. The kitchen counter features a small fridge,
  a sink and two stoves. A pop-up roof allows for standing upright and can be made into
  a second double bed.",
  capacity: 5,
  model: "Volkswagen Bus",
  year: 1990,
  user_id: User.last.id
}

nomad = {
  title: "Perfect traveller's Fiat Pop Top",
  price: 115,
  description: "Experience an unforgettable road trip in our Pop Top. This vehicle
  is a Weinsberg campervan built on a Fiat Ducato platform. The interior features a
  living area with a kitchenette, an integrated bathroom with a toilet and shower,
  and sleeping areas. This campervan can accommodate up to four people comfortably
  with its pop-up roof as well as a double bed located in the back of the van.
  It is the perfect option for the more demanding traveller and off-the-grid road
  trips in all weather conditions.",
  capacity: 4,
  model: "Fiat Ducato",
  year: 2017,
  user_id: User.last.id
}

kombi = {
  title: "California Premium for you & your bikes",
  price: 170,
  description: "With a design that recalls Volkswagen's iconic first camper vans, the
  VW California Premium is a modern symbol of independence and freedom. Indie Campers
  offers the 2023 version of the VW California Ocean model. It is a versatile camper
  van that is fully fitted and has a pop-up roof. It seats and sleeps up to 4 people.
  Bring your bikes for some action on your holidays - the VW California Premium features
  a bike rack, which carries 4 bikes.",
  capacity: 6,
  model: "Volkswagen Premium",
  year: 2020,
  user_id: User.last.id
}

luxmobile = {
  title: "Atlas semi-integrated Maxi Van",
  price: 225,
  description: "The sky is the limit when you travel with the Atlas. The RV has extra dimensions,
  and seats and sleeps up to 5 people. With premium furniture and a stationary heater, travelling
  in this semi-integrated camper van becomes a joy. You might actually be surprised by the comfort
  you can get on four wheels!",
  capacity: 5,
  model: "Mercedez-Benz",
  year: 2021,
  user_id: User.last.id
}

woodvan = {
  title: "Wooden Nomad Ivy van",
  price: 155,
  description: "Feel home wherever you go with the Nomad Ivy, a complete house built into a medium-sized camper van.
  It's comfy, has a stationary heating system, and is fully autonomous! In short, it is the perfect option for the
  more demanding traveller and off-the-grid road trips in all weather conditions. Our Nomad Ivy is a 4-berth vehicle.
  If you go on a two-people round trip (same pick-up and drop-off location), it is possible to remove the upper bed
  and enjoy an even more spacious sleeping area.",
  capacity: 4,
  model: "Fiat Ducato Knaus",
  year: 2018,
  user_id: User.last.id
}

toptin = {
  title: "The Active for easy traveling",
  price: 138,
  description: "The Active is a compact camper van. It has a fixed interior
  with all basics and travels up to four people. The interior features a living area,
  shower cabin, and sleeping area. The rear sleeping area consists of two fixed double beds.
  The Active comes with all services offered by Indie Campers, like 24/7 support
  and roadside assistance, a kitchen kit, a cleaning kit and a cooler.",
  capacity: 4,
  model: "Fiat Ducato",
  year: 2015,
  user_id: User.last.id
}

#six links here
photos = ["https://images.unsplash.com/photo-1594495894542-a46cc73e081a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80", "https://images.unsplash.com/photo-1609616678796-c288bea5ac24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80", "https://images.unsplash.com/photo-1535655685871-dc8158ff167e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80","https://images.unsplash.com/photo-1613750590555-5ad35bd95a99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80", "https://images.unsplash.com/photo-1566334003641-fbbc33f194d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", "https://images.unsplash.com/photo-1572830093421-377d162ca866?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80"]
filename = "name"
number = 0
[tincan, nomad, kombi, luxmobile, woodvan, toptin].each do |attributes|
  van = Van.create!(attributes)
  file = URI.open(photos[number])
  number += 1
  van.photos.attach(io: file, filename: "#{filename} #{number}", content_type: "image/png")
  van.save
  puts "Created #{van.title}"
end
puts "Finished!"


# IMAGES of the vans can wait - as a
# User uploaded images will be stored in cloudinary

# rails db:seed to see which vans are created - then you can work with the vans view to see how they're displayed

# rails console check that users and vans are created and can be accessed through for example .last .count?

# once everything works push the seeds to github branch git add - git commit - git push origin seed
# go to github and create a pull request
# someone else merges that pull
# there to everyone to pull
# exit your branch to master and pull to get the version to your own local machine too.
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

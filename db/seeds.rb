require "open-uri"

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

puts "Cleaning database..."
Van.destroy_all

puts "Creating vans..."

tincan = {
  title: "Special retro Volkswagen bus",
  price: 125,
  description: "With a design that recalls Volkswagen's iconic first camper vans,
  the VW California is a modern symbol of independence and freedom. Indie Campers
  offers the 2018 version of the VW California Bluemotion Coast and Ocean models.
  It is a versatile camper van that is fully fitted and has a pop-up roof.
  It travels up to four people. The interior has swivel chairs and a rear seat
  that retracts to make space for a stowaway table or folds into a double bed.
  The kitchen counter features a small fridge, a sink and two stoves.
  A pop-up roof allows for standing upright and can be made into a second double bed.
  The California comes with all services offered by Indie Campers, like 24/7 support
   and roadside assistance, a kitchen kit, a cleaning kit and a cooler.",
  capacity: 5,
  model: "Volkswagen Bus",
  year: 1980,
  user_id: User.last.id
}

nomad = {
  title: "Fiat Pop Top",
  price: 115,
  description: "Experience an unforgettable road trip in our Nomad Pop Top. This vehicle
  is a Weinsberg campervan built on a Fiat Ducato platform. The interior features a
  living area with a kitchenette, an integrated bathroom with a toilet and shower,
  and sleeping areas. This campervan can accommodate up to four people comfortably
  with its pop-up roof as well as a double bed located in the back of the van.
  The Nomad pop top is Indie Campers' medium-sized campervan. It's comfy, has an
  integrated heating system, and is fully autonomous. It is the perfect option
  for the more demanding traveller and off-the-grid road trips in all weather
  conditions. The living area has a bench, two swivel chairs, and a foldable table.
  The kitchenette is equipped with two gas stoves, a sink, and an 95L fridge.
  The bathroom has a toilet, washing basin, and a shower. The sleeping area
  consists of two double beds, one located on the pop-up roof and the other
  one located in the back of the van. The Nomad Pop Top comes with all services
  offered by Indie Campers, like 24/7 support and roadside assistance, a kitchen kit,
  and a cleaning kit.",
  capacity: 6,
  model: "Fiat Ducato",
  year: 2015,
  user_id: User.last.id
}

kombi = {
  title: "California Premium",
  price: 170,
  description: "With a design that recalls Volkswagen's iconic first camper vans, the
  VW California Premium is a modern symbol of independence and freedom. Indie Campers
  offers the 2023 version of the VW California Ocean model. It is a versatile camper
  van that is fully fitted and has a pop-up roof. It seats and sleeps up to 4 people.
  The interior features swivel chairs and a rear seat that retracts to make space for
  a stowaway table or folds into a double bed easily. The kitchen counter features a
  small fridge, a sink and two stoves. You can cook up a meal and then enjoy your time
  eating or playing together at the table inside the van. A pop-up roof allows for
  standing upright inside the van and can be transformed into a second double bed.
  Feel like relaxing outside of the vehicle? The awning at the outside of the camper
  van provides sun protection. In case it gets fresh outside, the van is equipped with
  integrated heating, which runs on Diesel. Because of the exciting driving experience,
  its compactness and the pragmatic layout, our VW California is a match for all kinds
  of travellers - especially road trip beginners. You don't know how to store all your
  luggage in this compact camper? You will be surprised about the big storage space under
  the rear bed, or in several drawers which are everywhere in the van. Bring your bikes
  for some action on your holidays - the VW California Premium features a bike rack,
  which carries 4 bikes. The VW California Premium comes with all services offered by Indie Campers, like 24/7 support and roadside assistance, a kitchen kit, a cleaning kit and a cooler.",
  capacity: 6,
  model: "Volkswagen Premium",
  year: 2020,
  user_id: User.last.id
}

luxmobile = {
  title: "Atlas maxi van",
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
  title: "Wooden Ivy van",
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
  title: "The Active & easy",
  price: 138,
  description: "The Active is a compact camper van from Indie X. It has a fixed interior
  with all basics and travels up to four people. We have some variations of the Active
  with a convertible interior. The interior is custom-built for Indie X in a FIAT Ducato.
  The interior features a living area, shower cabin, and sleeping area. The living area
  has two swivel chairs, a rear seat, a stowaway table and a small kitchen counter that
  features a sink and electric cooler. The shower cabin comes with a portable toilet, while
  a second shower head in the rear compartment enables outdoor showers. The rear sleeping
  area consists of two fixed double beds. Some interiors feature convertible double beds
  instead. The Active comes with all services offered by Indie Campers, like 24/7 support
  and roadside assistance, a kitchen kit, a cleaning kit and a cooler.",
  capacity: 4,
  model: "Fiat Ducato",
  year: 2012,
  user_id: User.last.id
}

#six links here
photos = ["https://images.unsplash.com/photo-1561361513-2d000a50f0dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmFufGVufDB8fDB8fA%3D%3D&w=1000&q=80", "https://images.unsplash.com/photo-1624355761500-f00bb5cfb5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80", "https://images.unsplash.com/photo-1535655685871-dc8158ff167e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80", "https://images.unsplash.com/photo-1613750590555-5ad35bd95a99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80", "https://images.unsplash.com/photo-1627386172764-1d1b7ea90b66?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2880&q=80", "https://images.unsplash.com/photo-1572830093421-377d162ca866?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80"]
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

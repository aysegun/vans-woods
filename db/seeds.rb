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
tincan = { title: "Special retro VW bus", price: 125, description: "jiiji", capacity: 7, model: "VW bus", year: 1980, user_id: User.last.id }
bulli = { title: "A nice little van", price: 115, description: "jiiji", capacity: 6, model: "VW bus", year: 2015, user_id: User.last.id }
kombi = { title: "Van for weekend trips", price: 100, description: "jiiji", capacity: 6, model: "VW bus", year: 2018, user_id: User.last.id }
woodvan = { title: "Wooden van", price: 155, description: "jiiji", capacity: 6, model: "VW bus", year: 2000, user_id: User.last.id}
luxmobile = { title: "A dreamy campervan", price: 225, description: "jiiji", capacity: 9, model: "VW bus", year: 2022, user_id: User.last.id }
toptin = { title: "Travel easy", price: 130, description: "jiiji", capacity: 6, model: "VW bus", year: 2020, user_id: User.last.id }

[tincan, bulli, kombi, woodvan, luxmobile, toptin].each do |attributes|
  van = Van.create!(attributes)
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

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 10.times do 
#   User.create(email: "#{Faker::Name.first_name}@fake.com", password: "password")
# end
# 
# 10.times do 
#   Band.create(name: Faker::LordOfTheRings.character)
# end
# 
boo = [true, false]

# 10.times do
#   Album.create(title: Faker::LordOfTheRings.location, band_id: rand(1..10), year: rand(1..2018), live: boo[rand(1..2)])
# end

10.times do |num|
  Track.create(band_id: rand(1..10), album_id: rand(1..10), title: "#{Faker::Superhero.prefix} #{Faker::Superhero.power}", ord: rand(num), bonus: boo[rand(1..2)], lyrics: Faker::BackToTheFuture.quote)
end
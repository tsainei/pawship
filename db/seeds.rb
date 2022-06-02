# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

addresses = ["Fortunagasse 28, Zurich", "Langmauerstrasse 30, Zurich", "Bahnofstrasse 20, Zurich", "Rennweg 57, Zurich"]

10.times do |cpt|
  user = User.create(
  email: Faker::Internet.email,
  password: "123456",
  password_confirmation: "123456"
)

  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    personality: Faker::Lorem.paragraph(sentence_count: 2),
    gender: "male",
    sex_orientation: "hecterosexual",
    training_status: "trained",
    breed: Faker::Creature::Dog.breed,
    address: addresses.sample,
    hobbies: Faker::Lorem.sentence,
    age: rand(15),
    has_breed_certificate: true,
    user: user,
    short_description: Faker::Lorem.paragraph(sentence_count: 2),
  )
  downloaded_image = URI.parse("https://placedog.net/#{290+cpt}/400").open

  dog.photo.attach(io: downloaded_image, filename: 'Sherlock.jpg')
  dog.save
end

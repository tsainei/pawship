# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
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
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    hobbies: Faker::Lorem.sentence,
    age: 1,
    has_breed_certificate: true,
    user: user,
    short_description: Faker::Lorem.paragraph(sentence_count: 2),
  )
  dog.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/Sherlock.jpg')), filename: 'Sherlock.jpg')
  dog.save
end

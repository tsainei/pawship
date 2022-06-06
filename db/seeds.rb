require 'faker'
require 'open-uri'

addresses = ["Fortunagasse 28, Zurich", "Langmauerstrasse 30, Zurich", "Bahnhofstrasse 20, Zurich", "Rennweg 57, Zurich"]
short_descriptions = ["A natural swimmer and hiker", "Always in for some cheese and bones", "A great cuddler and snuggler",
                     "Never fails to make you laugh", "You can count on me to make you laugh", "Bring me out for long walks", "Playful and cheeky one"]
genders = ["male", "female"]
personalities = ["Playful and cheeky", "Loving and caring", "The adaptable dog", "The independent dog", "A little shy and timid", "The laidback, happy dog", "The chilled and calm one"]
sex_orientations = ["heterosexual", "bisexual", "homosexual"]
trainings = ["trained", "untrained", "in training"]
hobby_list = ["Taking long walks", "Eating and munching", "Giving kisses", "Swimming", "Running"]

20.times do |cpt|
  user = User.create(
  email: Faker::Internet.email,
  password: "123456",
  password_confirmation: "123456"
)

  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    personality: personalities.sample,
    gender: genders.sample,
    sex_orientation: sex_orientations.sample,
    training_status: trainings.sample,
    breed: Faker::Creature::Dog.breed,
    address: addresses.sample,
    hobbies: hobby_list.sample,
    age: rand(15),
    has_breed_certificate: true,
    user: user,
    short_description: short_descriptions.sample,
  )
  downloaded_image = URI.parse("https://placedog.net/#{290+cpt}/400").open

  dog.photo.attach(io: downloaded_image, filename: 'Sherlock.jpg')
  dog.save
end

require 'faker'
require 'open-uri'

puts "making seed inputs"

addresses = ["Fortunagasse 28, Zurich", "Langmauerstrasse 30, Zurich", "Bahnhofstrasse 20, Zurich", "Rennweg 57, Zurich"]
short_descriptions = ["A natural swimmer and hiker", "Always in for some cheese and bones", "A great cuddler and snuggler",
"Never fails to make you laugh", "You can count on me to make you laugh", "Bring me out for long walks", "Playful and cheeky one"]
genders = ["male", "female"]
personalities = ["Playful and cheeky", "Loving and caring", "The adaptable dog", "The independent dog", "A little shy and timid", "The laidback, happy dog", "The chilled and calm one"]
sex_orientations = ["heterosexual", "bisexual", "homosexual"]
trainings = ["trained", "untrained", "in training"]
hobby_list = ["Taking long walks", "Eating and munching", "Giving kisses", "Swimming", "Running"]

puts "seed inputs complete"
puts "seeding fake dogs now"

10.times do |cpt|
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
    age: "#{rand(1..15)}yo",
    has_breed_certificate: true,
    user: user,
    short_description: short_descriptions.sample,
  )
  downloaded_image = URI.parse("https://placedog.net/#{290+cpt}/400").open
  dog.photo.attach(io: downloaded_image, filename: 'Sherlock.jpg')
  dog.save
end

puts "fake dog seeds complete"
puts "seeding dog 1 and user 1 now"

user_1 = User.create(
  email: "alain@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)
dog_1= Dog.new(
  name: "Sherlock",
  age: "3m",
  gender: "male",
  personality: "Cute like a pear",
  sex_orientation: "heterosexual",
  training_status: "in training",
  breed: "Entlebuch",
  address: "Fortunagasse 28, Zurich",
  hobbies: "taking long walks",
  has_breed_certificate: true,
  user: user_1,
  short_description: "I'm the cutest puppy ever"
)
dog_1.photo.attach(io: File.open(Rails.root.join('app/assets/images/Sherlock.jpg')), filename: 'Sherlock.jpg')
dog_1.save!

puts "dog 1 user 1 created"
puts "creating user and dog 2 now"

user_2 = User.create(
  email: "sue@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

dog_2 = Dog.new(
  name: "Chico and Buddy",
  personality: "One is a social buddy while the other behaves like a cat!",
  gender: "male",
  sex_orientation: "heterosexual",
  training_status: "trained",
  breed: Faker::Creature::Dog.breed,
  address: addresses.sample,
  hobbies: hobby_list.sample,
  age: "3yo",
  has_breed_certificate: true,
  user: user_2,
  short_description: "We are brothers."
)
dog_2.photo.attach(io: File.open(Rails.root.join('app/assets/images/chico_buddy.jpg')), filename: 'chico_buddy.jpg')
dog_2.save!
puts "user and dog 2 done"

puts "seeding dog 3 and user 3 now"

user_3 = User.create(
  email: "joy@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

dog_3= Dog.new(
  name: "Binky",
  age: "9yo",
  gender: "male",
  personality: "Reliable and friendly",
  sex_orientation: "heterosexual",
  training_status: "trained",
  breed: "Maltipoo",
  address: "Fortunagasse 28, Zurich",
  hobbies: "taking long walks in the park",
  has_breed_certificate: true,
  user: user_3,
  short_description: "I enjoy long walks and chicken for dinner."
)
dog_3.photo.attach(io: File.open(Rails.root.join('app/assets/images/Binky_pic.jpg')), filename: 'Binky_pic.jpg')
dog_3.save!

puts "dog 3 user 3 created"
puts "seeding dog 4 and user 4 now"

user_4 = User.create(
  email: "kim_ollie@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

dog_4= Dog.new(
  name: "Brownie",
  age: "1yo",
  gender: "male",
  personality: "Playful and a real foodie",
  sex_orientation: "heterosexual",
  training_status: "in training",
  breed: "Mini poodle",
  address: "Fortunagasse 28, Zurich",
  hobbies: "Eating and playing in the field",
  has_breed_certificate: true,
  user: user_4,
  short_description: "An ultra playful Irish dude"
)
dog_4.photo.attach(io: File.open(Rails.root.join('app/assets/images/Brownie_pic.jpg')), filename: 'Brownie_pic.jpg')
dog_4.save!

puts "dog 4 user 4 created"
puts "seeding dog 5 and user 5 now"

user_5 = User.create(
  email: "sophie@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

dog_5= Dog.new(
  name: "Maggie",
  age: "1yo",
  gender: "female",
  personality: "A happy paw friend who loves kisses",
  sex_orientation: "heterosexual",
  training_status: "trained",
  breed: "Mini poodle",
  address: "Köchlistrasse 18, Zurich",
  hobbies: "Loves catching balls and chilling in cool corners of the house",
  has_breed_certificate: true,
  user: user_5,
  short_description: "I give free hugs and kisses on demand"
)
dog_5.photo.attach(io: File.open(Rails.root.join('app/assets/images/Maggie_pic.jpg')), filename: 'Maggie_pic.jpg')
dog_5.save!

puts "dog 5 user 5 created"
puts "seeding dog 6 and user 6 now"

user_6 = User.create(
  email: "kelvin@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

dog_6= Dog.new(
  name: "Timo",
  age: "13yo",
  gender: "male",
  personality: "Gentle and calm, lives only to be patted on the head",
  sex_orientation: "heterosexual",
  training_status: "trained",
  breed: "Poodle Pointer Cross",
  address: "Köchlistrasse 18, Zurich",
  hobbies: "Swimming and chilling out at home",
  has_breed_certificate: true,
  user: user_6,
  short_description: "The gentlest, calmest gentleman"
)
dog_6.photo.attach(io: File.open(Rails.root.join('app/assets/images/Timo_pic.jpg')), filename: 'Timo_pic.jpg')
dog_6.save!

puts "dog 6 user 6 created"
puts "All seeding completed"

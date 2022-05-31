class Dog < ApplicationRecord
  belongs_to :user
  has_many :swipes, inverse_of: 'swiper_dog'
  has_many :swipers, inverse_of: 'swiped_dog'
  validates :short_description, presence: true, length: { maximum: 50 }
  validates :name,
            :age,
            :personality,
            :gender,
            :sex_orientation,
            :training_status,
            :breed,
            :has_breed_certificate,
            :hobbies,
            :address,
            presence: true
end

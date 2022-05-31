class Dog < ApplicationRecord
  belongs_to :user
  has_many :swiper_dog_ids, class_name: "Swipe"
  has_many :swiped_dog_ids, class_name: "Swipe"
end

class Dog < ApplicationRecord
  belongs_to :user
  has_many :swiper_dog,
           class_name: 'Swipe',
           foreign_key: 'swiper_dog_id',
           dependent: :destroy
  has_many :swiped_dog,
           class_name: 'Swipe',
           foreign_key: 'swiped_dog_id',
           dependent: :destroy
  validates :short_description, presence: true, length: { maximum: 50 }
end

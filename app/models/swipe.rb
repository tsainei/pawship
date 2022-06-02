class Swipe < ApplicationRecord
  belongs_to :swiper_dog, class_name: 'Dog', foreign_key: 'swiper_dog_id'
  belongs_to :swiped_dog, class_name: 'Dog', foreign_key: 'swiped_dog_id'
  scope :likes, -> { where(liked: true) }
end

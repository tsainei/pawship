class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dogs
  has_many :swiped_dog, through: :dogs, source: :swiped_dog_ids
  has_many :swiper_dog, through: :dogs, source: :swiper_dog_ids
end

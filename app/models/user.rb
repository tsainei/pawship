class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :dog
  has_many :swiped_dog_ids, through: :dogs, source: :swiped_dog_ids
  has_many :swiper_dog_ids, through: :dogs, source: :swiper_dog_ids
end

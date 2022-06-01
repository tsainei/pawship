class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :swipes, class_name: 'Swipe', foreign_key: 'swiper_dog_id'
  has_many :swipers, class_name: 'Swipe', foreign_key: 'swiped_dog_id'

  validates :short_description, presence: true, length: { maximum: 50 }
  validates :name,
            :birthday,
            :personality,
            :gender,
            :sex_orientation,
            :training_status,
            :breed,
            :has_breed_certificate,
            :hobbies,
            :address,
            :photo,
            presence: true
  validate :dates_valid?

  def dates_valid?
    return if birthday.blank? || birthday.future?
    if birthday > Time.current.beginning_of_day
      return errors.add(:birthday, 'must be in the future')
    end
  end
end

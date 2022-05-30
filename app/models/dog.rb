class Dog < ApplicationRecord
  belongs_to :user
  has_many :swipes
end

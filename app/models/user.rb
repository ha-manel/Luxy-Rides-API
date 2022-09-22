class User < ApplicationRecord
  has_many :cars
  has_many :reservations

  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true
end

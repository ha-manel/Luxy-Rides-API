class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :model, presence: true
  validates :picture, presence: true
  validates :driver_name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end

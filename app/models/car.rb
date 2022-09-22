class Car < ApplicationRecord
  belongs_to :user

  validates :model, presence: true
  validates :picture, presence: true
  validates :driver_name, presence: true, length: {maximum: 50 }
end

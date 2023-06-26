class User < ApplicationRecord
  has_many :cars
  has_many :reservations

  validates :name, presence: true
  validates :email, presence: true
end

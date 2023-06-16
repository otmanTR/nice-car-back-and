class User < ApplicationRecord
  has_many :cars
  has_many :reservations

  validate :name, presence: true
end

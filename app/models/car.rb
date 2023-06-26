class Car < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, message: 'Name must have 3 or more characters' }
  validates :image, presence: true
  validates :model, presence: true
  validates :price,
            presence: true,
            numericality: { greater_than: 0, message: 'Price must be greater than 0' }

  belongs_to :user
  has_many :reservations, dependent: :destroy
end

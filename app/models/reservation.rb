class Reservation < ApplicationRecord
  belongs_to :car, foreign_key: 'car_id'
  belongs_to :user, foreign_key: 'user_id'

  validates :start_date, presence: true
  validates :city, presence: true
  validates :end_date, presence: true
end

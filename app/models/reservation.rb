class Reservation < ApplicationRecord
  belongs_to :car, foreign_key: 'car_id'
  belongs_to :user, foreign_key: 'user_id'

  validates :start_date, :end_date, :city, presence: true
  validates :start_date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date
end

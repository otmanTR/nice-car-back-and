class Reservation < ApplicationRecord
  belongs_to :car, foreign_key: 'car_id'
  belongs_to :user, foreign_key: 'user_id'

  validates :start_date, :end_date, :city, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end

  def end_date_cannot_be_before_start_date
    errors.add(:end_date, "can't be before the start date") if start_date.present? && end_date.present? && end_date < start_date
  end
end

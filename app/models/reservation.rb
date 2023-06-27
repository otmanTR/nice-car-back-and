class Reservation < ApplicationRecord
  belongs_to :car, foreign_key: 'car_id'
  belongs_to :user, foreign_key: 'user_id'

  validates :start_date, presence: true
  validates :city, presence: true
  validates :end_date, presence: true
  validate :dates_cannot_be_in_past, :end_date_cannot_be_before_start_date

  def dates_cannot_be_in_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end

    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end
end

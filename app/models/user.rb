class User < ApplicationRecord
  has_many :cars
  has_many :reservations
  has_secure_password

  validates :name, presence: { message: 'Your Name.' }
  validates :email, presence: { message: 'This email is already registered.' },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end

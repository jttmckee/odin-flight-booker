class Passenger < ApplicationRecord
  belongs_to :flight
  belongs_to :booking

  validates :name, length: {in: 3..255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, length: {in: 1..255}
end

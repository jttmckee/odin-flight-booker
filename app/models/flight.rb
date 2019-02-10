class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name:  'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :passengers
  has_many :bookings

  def duration
    arriving - leaving
  end

  def duration=(duration)
    self.leaving = arriving + duration
  end

end

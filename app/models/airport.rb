class Airport < ApplicationRecord
  validates :name, length: {within: 3..255}
  validates :code, length: {is:3}, uniqueness: {case_sensitive:false}
  has_many :arrivals, class_name: 'Flight', foreign_key: 'arrival_airport_id'
  has_many :departures, class_name: 'Flight', foreign_key: 'departure_airport_id'
end

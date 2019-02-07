class AddAirportsToFlights < ActiveRecord::Migration[5.1]
  def change
    add_reference :flights, :departure_airport, foreign_key: true
    add_reference :flights, :arrival_airport, foreign_key: true
    add_index :flights, :departure_airport
    add_index :flights, :arrival_airport
  end
end

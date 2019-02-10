class AddAirportsToFlights < ActiveRecord::Migration[5.1]
  def change
    add_reference :flights, :departure_airport
    add_reference :flights, :arrival_airport
    #add_index :flights, :departure_airport
    #add_index :flights, :arrival_airport
    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end

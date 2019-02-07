class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :leaving
      t.datetime :arriving

      t.timestamps
    end
  end
end

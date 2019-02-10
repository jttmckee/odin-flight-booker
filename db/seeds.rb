# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(
  [
    {name:'Atlanta',      code: 'ATL'},
    {name:'Beijing',      code: 'PEK'},
    {name:'Dubai',        code: 'DXB'},
    {name:'Los Angeles',  code: 'LAX'},
    {name:'Tokyo',        code: 'HND'},
    {name:'Chicago',      code: 'ORD'},
    {name:'Hong Kong',    code: 'HKG'},
    {name:'London',       code: 'LHR'},
    {name:'Paris',        code: 'CDG'},
    {name:'Amsterdam',    code: 'AMS'},
    {name:'Frankfurt',    code: 'FRA'},
    {name:'Madrid',       code: 'MAD'},

  ]
)

start = Time.local(2020,1,1)
finish = Time.local(2020,3,31)
1000.times do
  leaving = start + rand * (finish - start)
  length = 0.4.hours + rand * (18.hours)
  arriving = leaving + length
  departure = Airport.order('RANDOM()').take
  arrival = Airport.where.not(id: departure.id).order('RANDOM()').take
  Flight.create(leaving: leaving, arriving: arriving,
    departure_airport: departure, arrival_airport: arrival)
end

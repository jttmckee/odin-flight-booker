class FlightsController < ApplicationController

  def index
    @arrival_airports = @departure_airports = Airport.all
    @passengers = [['1',1],['2',2],['3',3],['4',4]]
    #@available_dates =  Flight.all.pluck(:leaving).uniq.sort
    @last_date = Flight.maximum(:leaving).to_date
    @flight_date = @first_date = Flight.minimum(:leaving).to_date
    @departure = @arrival = @arrival_airports.first

    if search = params[:flight]
      @num_passengers = params[:booking][:passengers]
      @flight_date = search[:leaving_date]
      @departure = search[:departure_airport_id]
      @arrival = search[:arrival_airport_id]

      @flights = Flight.where(
        departure_airport_id: @departure,
        arrival_airport_id: @arrival ).where(
          "CAST(leaving AS date) = ?", @flight_date
        ).order(:leaving)

      if @flights.empty?
        @flights =        Flight.where(
                departure_airport_id: @departure,
                arrival_airport_id: @arrival).where(
                  "CAST(leaving AS date) BETWEEN
                  (CAST(:leaving AS date) - INTERVAL'14 days') AND
                  (CAST(:leaving AS DATE) + INTERVAL'14 days')
                  ", leaving: @flight_date
                ).order(:leaving)
        if @flights.empty?
          flash.now[:warning] =
          'Sorry there are no flights between those airports.  Please try again.'
        else

          flash.now[:info] =
          'Sorry there are not flights for those dates.  Showing other dates within two weeks.'
        end
      end
    end
  end
end

class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight])

    params[:num_passengers].to_i.times {@booking.passengers.build(
      flight_id:@booking.flight_id)}

  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:info] = 'Booking confirmed'
      redirect_to booking_path(@booking)
    else
      flash.now[:error] = 'Details incorrect'
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

private
  def booking_params
    params.require(:booking).permit(:flight_id,
      passengers_attributes: [:name,:email,:flight_id])
  end
end

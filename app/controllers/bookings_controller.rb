class BookingsController < ApplicationController

  def my_bookings
    @booking.user = current_user
    @booking.user = Booking.all
  end
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @surfboard = Surfboard.find(params[:surfboard_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.surfboard = Surfboard.find(params[:surfboard_id])
    @booking.user = current_user
    if @booking.save!
      redirect_to surfboard_booking_path(@booking.surfboard.id, @booking.id)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def booking_params
    params.require(:booking).permit(:surfboard_id, :user_id, :status, :startdate, :enddate)
  end
end

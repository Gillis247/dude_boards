class BookingsController < ApplicationController

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
    @booking.client = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.surfboard = Surfboard.find(params[:surfboard_id])
    @booking.client = current_user
    if @booking.update!(booking_params)
      redirect_to surfboards_path
    else
      render :edit
    end
  end

  def my_bookings
    now = DateTime.now
    @current_bookings = current_user.bookings.where("enddate > ?", now)
    @old_bookings = current_user.bookings.where("enddate < ?", now)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.client = current_user
    @booking.destroy
    redirect_to my_bookings_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:surfboard_id, :user_id, :status, :startdate, :enddate)
  end
end

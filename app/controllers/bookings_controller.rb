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
    @booking.surfboard = Surfboard.find(@booking.surfboard_id)

    if @booking.update!(booking_params)
      redirect_to surfboards_path
    else
      render :edit
    end
  end

  def my_bookings
    now = DateTime.now
    @current_bookings = current_user.bookings.where("end_date > ?", now)
    @old_bookings = current_user.bookings.where("end_date < ?", now)

  end

  def bookings_requests
    # @bookings_requested = Booking.select { |booking| booking.surfboard.id == :surfboard_id }
    @bookings_requested = Booking.select { |booking| booking.surfboard.owner == current_user }
    # @bookings_requested.surfboard = Surfboard.find(params[:surfboard_id])
    # if @bookings_requested.find(:surfboard_id).update(approved: true)
    #   redirect_to bookings_bookings_requests_path
    # end
    #   redirect_to bookings_requests_path
    # else
    #   render :'bookings/bookings_requests'
    # end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.client = current_user
    @booking.destroy
    redirect_to my_bookings_bookings_path
  end

  # def booking_request
  #   @bookings = current_user.bookings
  #   # /users/{id}/booking_requests
  #   # get user_id from params
  #   # get user by id => user = User.find(id)
  #   # surfboards = user.surfboards
  #   # @requested_bookings = []
  #   # for surfboard in surfboards:
  #   #   surfboard_bookings = Bookings.where("surfboard_id = ", surfboard.id).and("approved", false)
  #   #   @requested_bookings.concat surfboard_bookings
  # end

  private

  def booking_params
    params.require(:booking).permit(:surfboard_id, :user_id, :status, :start_date, :end_date, :approved)
  end
end

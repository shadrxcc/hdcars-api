class BookingsController < ApplicationController
    def index
    @bookings = Booking.all
    render json:@bookings
  end

  def show
    @bookings = Booking.find(params[:id])
    render json: @bookings
  end

  def create
    @Booking = Booking.new(bookings_params)
    if @Booking.save
      render json: {
        success: 'Booking successful'
      },
             status: :created
    else
      render json: {
        error: 'Booking was not created'
      },
             status: :bad_request
    end
  end

  def destroy
    @bookings = Booking.all
    Booking.find(params[:id]).destroy!
    render json: @bookings
  end

  def bookings_params
    params.permit(:user, :car, :start_date, :location, :price, :image)
  end
end

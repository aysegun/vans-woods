class BookingsController < ApplicationController
  before_action :set_van, only: %i[create new edit]
  before_action :set_booking, only: %i[new]

  def index
    @bookings = Booking.all.where(user_id: current_user.id)
    @received_bookings = current_user.received_bookings
  end

  def received_bookings
    @received_bookings = current_user.received_bookings
  end

  def new; end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.van = @van
    if @booking.save
      redirect_to bookings_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: params[:status])

    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to van_path(@booking.user), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.new
  end

  def set_van
    @van = Van.find(params[:van_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :user_id, :start_date, :end_date)
  end
end

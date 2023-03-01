class BookingsController < ApplicationController
  before_action :set_van, only: %i[create new]
  before_action :set_booking, only: %i[new]

  def index
    @bookings = Booking.all.where(user_id: curent_user.id)
  end

  def new; end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.van = @van
    if @booking.save
      redirect_to vans_path
    else
      render 'new', status: :unprocessable_entity
    end
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
    params.require(:booking).permit(:status, :user_id)
  end
end
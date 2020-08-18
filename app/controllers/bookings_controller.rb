class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.instrument = @instrument
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to instruments_path, notice: 'Booking was successfully canceled.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:checking_in_date, :checking_out_date, :rental_price_total, :rental_fees, :transfer_date)
  end
end

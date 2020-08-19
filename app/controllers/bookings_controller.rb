class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @instrument = Instrument.find(params[:instrument_id])
    @booking.user = @user
    @booking.instrument = @instrument
    @booking.status = "pending"
    @booking_days = params[:checking_out_date] - params[:checking_in_date]
    @total_price = @instrument.price_per_day*@nbdays

    if @booking.save!
      redirect_to dashboard_path
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

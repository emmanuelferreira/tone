

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(status: "pending")
    @user = current_user
    @instrument = Instrument.find(params[:instrument_id])
    @check_in_date = params["booking"]["check_in_date"].to_date
    @check_out_date = params["booking"]["check_out_date"].to_date
    @rental_days = (@check_out_date - @check_in_date).to_i
    @rental_price_total = @rental_days * @instrument.price_per_day
    @booking.rental_price_total = @rental_price_total
    @booking.check_in_date = @check_in_date
    @booking.check_out_date = @check_out_date
    @booking.user = @user
    @booking.instrument = @instrument
    @booking.save!
    redirect_to dashboard_path, notice: 'Booking was successfully sent.'
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_path, notice: 'Booking status was successfully updated.'
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
    params.require(:booking).permit(:check_in_date, :check_out_date, :rental_price_total,
                                    :rental_fees, :transfer_date, :status)
  end
end

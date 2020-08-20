class DashboardsController < ApplicationController

  def summary
    @user = current_user
    @instruments = Instrument.where(user: @user)
    @bookings_made = Booking.where(user: @user)
    @bookings_received = Booking.includes(:instrument).where(instruments: { user_id: @user.id })
  end
end

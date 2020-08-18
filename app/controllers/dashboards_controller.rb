class DashboardsController < ApplicationController
  def summary
    if current_user.instruments
      @instruments = Instrument.where(user: current_user)
    end

    if current_user.bookings
      @bookings = Booking.where(user: current_user)
    end
  end
end

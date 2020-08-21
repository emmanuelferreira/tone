class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  geocoded_by :pickup_address

  validates :category, :title, :description, :pickup_address, :price_per_day, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_t: 1 }
  after_validation :geocode, if: :will_save_change_to_pickup_address?

  def available?(check_in_date, check_out_date)
    bookings.each do |booking|
      if booking.check_in_date > check_out_date || booking.check_out_date < check_in_date
        return true
      else
        return false
      end
    end
  end

  def unavailable_dates
    bookings.pluck(:check_in_date, :check_out_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end

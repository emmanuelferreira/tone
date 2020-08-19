class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  geocoded_by :pickup_address

  validates :category, :pickup_address, :price_per_day, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end

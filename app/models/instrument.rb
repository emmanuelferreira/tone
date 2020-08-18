class Instrument < ApplicationRecord
  belongs_to :user

  validates :category, :pickup_address, :price_per_day, presence: true

end

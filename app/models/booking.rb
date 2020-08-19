class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :status, inclusion: { in: %w(accepted pending declined) }

end

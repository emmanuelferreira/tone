class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :status, inclusion: { in: %w(accepted pending declined) }

  validates :check_in_date, :check_out_date, presence: true
  validate :check_out_date_after_check_in_date

  def self.status
    %w(accepted pending declined)
  end


private
  def check_out_date_after_check_in_date
    return if check_out_date.blank? || check_in_date.blank?
    if check_out_date < check_in_date
      errors.add(:check_out_date, "must be after the start date")
    end
  end
end

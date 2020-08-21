class Review < ApplicationRecord
  belongs_to :booking

  validates :comment, presence: :true
  validates :rating, inclusion: { in: 0..5 }
end

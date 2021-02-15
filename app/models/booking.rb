class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :surfboard
  validates :startdate, :enddate, presence: true
  # validates :status, presence: true
end

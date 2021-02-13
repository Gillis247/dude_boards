class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :surfboard
  validates :startdate, presence: true
  validates :enddate, presence: true
  # validates :status, presence: true
end

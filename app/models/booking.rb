class Booking < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  belongs_to :surfboard
  validates :startdate, :enddate, presence: true
  # validates :status, presence: true
end

class Booking < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  belongs_to :surfboard
  validates :start_date, :end_date, presence: true
  # validates :status, presence: true
end

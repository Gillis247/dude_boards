class Surfboard < ApplicationRecord
  belongs_to :user
  has_many :bookings
  #validates :name, :details, :price, :location, presence: true
  #validates :name, uniqueness: true
  #validates :available, inclusion: { in: [ true, false ] }
end

class Surfboard < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  #validates :name, :details, :price, :location, presence: true
  #validates :name, uniqueness: true
  #validates :available, inclusion: { in: [ true, false ] }
end

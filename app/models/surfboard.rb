class Surfboard < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_one_attached :photo
  validates :name, :details, :price, :location, presence: true

  #validates :name, :details, :price, :location, presence: true
  #validates :name, uniqueness: true
  #validates :available, inclusion: { in: [ true, false ] }
end

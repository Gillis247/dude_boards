class Booking < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  belongs_to :surfboard
  validates :start_date, :end_date, presence: true
  # validates :status, presence: true
  validate :end_date_after_start_date
  # before_create :check_date_availability
  #
  # private
  # def self.check_date_availability(booking_params)
  #   bookings = Booking.where('start_date < ? OR end_date > ?', self.start_date, self.end_date)
  #   return bookings.empty?
  # end
  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
    errors.add(:start_date, "can't be before the date of today") if start_date < DateTime.now
  end
end

require 'date'

class Booking

  include DataMapper::Resource

  belongs_to :user
  belongs_to :listing

  property :id, Serial
  property :start_date, Date
  property :end_date, Date
  property :confirmation, Boolean, :default => false

  def date_validation(start_date, end_date, listing_id)
    check_dates = []
    booked_dates(listing_id).each do |booked_date|
      check_dates << (Date.parse(start_date) < booked_date[:start_date] && Date.parse(end_date) < booked_date[:start_date]) ||
      (Date.parse(start_date) > booked_date[:end_date] && Date.parse(end_date) > booked_date[:end_date])
    end
    !check_dates.include?(false)
  end

  def booked_dates(listing_id)
    bookings = Booking.all(listing_id: listing_id)
    dates = []
    bookings.each do |booking|
      dates << { start_date: booking.start_date, end_date: booking.end_date }
    end
    dates
  end

end

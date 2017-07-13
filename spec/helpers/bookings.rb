require 'date'
module BookingsHelpers
  def new_booking(start_date: "2017-09-21", end_date: "2017-09-29", listing_id: 1)
    visit '/bookings/bookingtrial'
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    fill_in :listing_id, with: listing_id
    click_button('Book now')
  end
end

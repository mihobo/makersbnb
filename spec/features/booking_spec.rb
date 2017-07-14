feature 'can book a listing' do
  before(:each) do
    sign_up
    sign_in(email: "johnsmith@aol.com", password: "password")
  end
  scenario 'inserting a valid date' do
    new_listing
    expect { new_booking }.to change(Booking, :count).by(1)
    expect(page).to have_content('Booking request sent')
  end

  scenario 'inserting invalid dates' do
    new_listing
    new_booking
    expect { new_booking(start_date: '2017-09-22', end_date: '2017-09-28') }.to change(Booking, :count).by(0)
    expect(page).to have_content('Dates are unavailable')
  end

  scenario 'owner can access a page to confirm a booking' do
    new_listing
    new_booking
    booking = Booking.first
    visit "/bookings/#{booking.id}"
    click_button 'Confirm Booking'
    booking_updated = Booking.first
    expect(booking_updated.confirmation).to be true
    expect(page).to have_content('Booking confirmed!')
  end
  scenario 'user can access booking url' do
    new_listing
    go_to_booking
    listing = Listing.first
    expect(current_path).to eq "/bookings/new/#{listing.id}"
  end
  scenario 'user can make a booking request' do
    new_listing
    go_to_booking
    expect{ request_booking }.to change(Booking, :count).by(1)
  end 
end

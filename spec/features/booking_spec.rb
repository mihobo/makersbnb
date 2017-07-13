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
end

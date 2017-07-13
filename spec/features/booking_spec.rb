feature 'can book a listing' do
  before(:each) do
    sign_up
    sign_in(email: "johnsmith@aol.com", password: "password")
  end   
  scenario 'inserting a valid date' do
    new_listing
    expect { new_booking }.to change(Booking, :count).by(1)
  end 
end 

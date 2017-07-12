
describe Booking do
  before(:each) do
    User.create(email: 'test@test.com', first_name: 'a', last_name: 'b', username: 'c', password: 'test', password_confirmation: 'test')
    Listing.create(title: 'random', location: 'London', beds: 3, price: '200', max_guests: 3, user_id: 1)
    Booking.create(start_date: '2017-08-01', end_date: '2017-09-01',user_id: 1, listing_id: 1)
  end

  describe "#date_validation" do

    it "should only return true if requested date does not conflict any booked dates" do
      start_date = '2017-08-01'
      end_date = '2017-09-01'
      expect(subject.date_validation(start_date,end_date,1)).to eq false
    end
  end
end

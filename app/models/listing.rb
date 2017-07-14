class Listing

  include DataMapper::Resource

  has n, :bookings
  belongs_to :user

  property :id, Serial
  property :title, String
  property :location, String
  property :beds, Integer
  property :price, String
  property :max_guests, Integer

end

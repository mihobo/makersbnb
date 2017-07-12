class Listing

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :location, String
  property :beds, Integer
  property :price, String
  property :max_guests, Integer

end

class Booking

  include DataMapper::Resource 
  
  belongs_to :user
  belongs_to :listing

  property :id, Serial
  #property :start_date, Date
  #property :end_date, Date

end 

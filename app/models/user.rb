class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :first_name, String
  property :last_name, String
  property :username, String
  property :password, Text

end

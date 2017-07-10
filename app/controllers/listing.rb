class Bnb < Sinatra::Base
  get '/listings' do
    @listings = Listing.all
    erb :'listings'
  end
  #
  # get '/listings/new' do
  #
  # end

end

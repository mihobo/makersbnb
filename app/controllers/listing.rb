class Bnb < Sinatra::Base
  get '/listings' do
    @listings = Listing.all
    erb :'/listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    Listing.create(title: params[:title],
    location: params[:location],
    beds: params[:beds],
    price: params[:price],
    max_guests: params[:max_guests])
    redirect '/listings'
  end

end

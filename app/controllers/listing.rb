class Bnb < Sinatra::Base

  get '/listings' do
    @listings = Listing.all
    erb :'/listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    Listing.first_or_create(title: params[:title],
    location: params[:location],
    beds: params[:beds],
    price: params[:price],
    max_guests: params[:max_guests])
    redirect '/listings'
  end

  post '/search' do
    redirect "/search/#{params[:location]}"
  end

  get '/search/:location' do
    @listings = Listing.all(location: params[:location])
    erb :'listings/index'
  end
end

class Bnb < Sinatra::Base

  get '/listings' do
    @listings = Listing.all
    erb :'/listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    if current_user
      Listing.first_or_create(title: params[:title],
      location: params[:location],
      beds: params[:beds],
      price: params[:price],
      max_guests: params[:max_guests],
      user_id: current_user.id)

      redirect '/listings'
    else
      flash[:notice] = 'Sign in to create a listing'
      redirect '/listings'
    end
  end

  get "/listings/:listing_id" do
    @listing = Listing.all(id: params[:listing_id])
    erb :'listings/listing'
  end

  post '/search' do
    if !params[:max_guests]
      redirect "/search/#{params[:location]}"
    else
      redirect "/search/#{params[:location]}&#{params[:max_guests]}"
    end
  end

  get "/search/:location&:max_guests" do
    @listings = Listing.all(location: params[:location], max_guests: params[:max_guests])
    erb :'listings/index'
  end

  get "/search/:location&" do
    @listings = Listing.all(location: params[:location], :max_guests.gte => 1)
    erb :'listings/index'
  end

end

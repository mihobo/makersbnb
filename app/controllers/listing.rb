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
      max_guests: params[:max_guests])
      redirect '/listings'
    else
      flash[:notice] = 'Sign in to create a listing'
      redirect '/listings'
    end
  end

  post '/search' do
    redirect "/search/#{params[:location]}&#{params[:max_guests]}"
  end

  get "/search/:location&:max_guests" do
    @listings = Listing.all(location: params[:location], max_guests: params[:max_guests])

    erb :'listings/index'
  end
end

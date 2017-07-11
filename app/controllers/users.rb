class Bnb < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      first_name: params[:first_name],
                      last_name: params[:last_name],
                      username: params[:username],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/listings'
    else 
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

end

class Bnb < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      first_name: params[:firstname],
                      last_name: params[:lastname],
                      username: params[:username],
                      password: params[:password])
    @user.save
    session[:user_id] = @user.id
    redirect '/'
  end

end

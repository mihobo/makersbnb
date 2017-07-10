class Bnb < Sinatra::Base

  enable :sessions

  get '/' do
    @username = current_user.username
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

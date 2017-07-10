class Bnb < Sinatra::Base

  enable :sessions

  get '/' do
    "WOOOOOO"
  end

  run! if app_file == $0
end

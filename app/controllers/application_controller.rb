require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, ENV["SESSIONS_SECRETS"]
  end

  get '/' do
    erb :"Hello World"
  end

  

end

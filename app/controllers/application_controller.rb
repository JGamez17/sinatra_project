require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, ENV["SESSIONS_SECRETS"]
  end

  get "/" do

    erb :"Hell World!"
  end

end

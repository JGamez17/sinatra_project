require './config/environment'

class ApplicationController < Sinatra::Base 

  configure do                        #tells the controller where to look to find views
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "SESSION_SECRET"
  end

  get '/' do
    erb :'welcome'
  end

  helpers do
  
    def current_user 
     @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  end  

  def is_logged_in?
    !!current_user  #if logged_in = true
  end

  def if_not_logged_in_redirect_to_login
    if !is_logged_in?
      redirect to '/users/login'
    end
  end

  def if_logged_in_redirect_to_sneakers
    if is_logged_in?
      redirect to '/sneakers'
    end
  end
end

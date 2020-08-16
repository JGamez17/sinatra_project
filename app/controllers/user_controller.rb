class UserController < ApplicationController 

    get '/' do 
        erb :welcome
    end

    get '/users/signup' do 
        if_logged_in_redirect_to_sneakers
        erb :'/users/signup'
    end

    post '/users/signup' do
        @user = User.new(params) 
        if @user.save
           session[:user_id] = @user.id
           redirect "/sneakers"
        else 
            @error_message = "Please try again, user name & password required or user already taken"
            erb :"/users/signup"
        end
    end

    get '/users/login' do
        if_logged_in_redirect_to_sneakers
        erb :'/users/login'
    end

    get '/users/:id' do
        if_logged_in_redirect_to_sneakers
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    post '/users/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/sneakers"
        else 
            @error_message = "Sneaker Head not found, Please Sign Up"
            erb :'users/signup'
        end    
    end

    delete '/logout' do
        session.destroy
        redirect '/'
    end
    
end

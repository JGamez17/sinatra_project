class UserController < ApplicationController 

    get '/' do 
        erb :welcome
    end

    get '/users/signup' do 
        erb :'/users/signup'
    end

    post '/users/signup' do
        @user = User.new(params) 
        if @user.save
           redirect "/sneakers"
        else 
            @error_message = "Please try again, user name & password required or user already taken"
            erb :"/users/signup"
        end
    end

    get '/users/login' do
        erb :'/users/login'
    end

    get '/users/:id' do
        binding.pry
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

class UserController < ApplicationController 

    get '/' do 
        erb :welcome
    end

    get '/users/signup' do 
        erb :'/users/signup'
    end

    post '/users/signup' do
        # binding.pry
        user = User.new(username: params[:username], password: params[:password]) #from controller to view as an instance variable
        if user.save
            redirect "/users/login"
        else 
            redirect "/failure"
        end
        redirect "/users/sneakers"
    end
   
    get '/users/login' do
        erb :'/users/login'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    post '/users/login' do 
        @user = User.find_by(username: params[:username])
        # binding.pry
        # session[:user_id] = @user.id
        if @user
        redirect "/users/#{@user.id}"
        else 
            redirect '/failure'
        end
    end

    get '/failure' do
        erb :failure
    end


    
end

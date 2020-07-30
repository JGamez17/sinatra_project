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
            redirect "/users/login"
        else 
            erb :"/users/login"
        end
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
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/sneakers"
        else 
            erb :'users/login'
        end    
    end

    delete '/logout' do
        session.destroy
        redirect '/users/login'
    end

    get '/failure' do
        erb :failure
    end
    
end

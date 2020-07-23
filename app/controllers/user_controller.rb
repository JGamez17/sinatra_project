class UserController < ApplicationController 

    get '/users/signup' do 
        erb :'/users/signup'
    end

    post '/users/signup' do
        # params[:username]
        # params[:password]

        @user = User.create(username: params[:username], password: params[:password]) #from controller to view as an instance variable
        redirect "/users/#{@user.id}"
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        # binding.pry
        erb :'/users/show'

    end

end

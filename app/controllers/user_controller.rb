class UserController < ApplicationController 

    get '/users/signup' do 
        erb :'/users/signup'
    end

    post 'users/signup' do


        params.inspect
    end

end
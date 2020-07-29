class SneakerController < ApplicationController

    #index action: list all sneakers

    get '/sneakers' do
        if user_logged_in?
        @sneakers = current_user.sneakers  
        erb :'sneakers/index'
        end
    end

    #new action
    get '/sneakers/new' do
        erb :'sneakers/new'
    end

    #create action
     post '/sneakers' do 
        @sneaker = Sneaker.create(params)
        redirect "/sneakers/#{@sneaker.id}"
     end

    #show action 

    get '/sneakers/:id' do
        @sneaker = Sneaker.find(params[:id])
        if @sneaker
            erb :'sneaker/show'
        else
            redirect "/sneakers"
        end
    end
    

    #edit action(view for form that will update)

    #update action 
    
    #delete action 
    
end
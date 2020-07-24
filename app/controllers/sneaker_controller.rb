class SneakerController < ApplicationController

    #index action: list all sneakers
    get '/sneakers' do
        @sneakers = Sneaker.all
        erb :'sneakers/index' #renders this particular view 
    end

    get '/sneakers' do
        @sneakers = current_user.sneaker
        erb :'sneakers/index'
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

    #edit action(view for form that will update)

    #update action 
    
    #delete action 

    get '/sneakers/:id' do 
        @sneaker = Sneaker.find(params[:id])
        erb :'/sneakers/show'
    end
    
end
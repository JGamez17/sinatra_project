class SneakerController < ApplicationController

    #index action: list all sneakers

    get '/sneakers' do
        # binding.pry
            @sneaker = current_user.sneakers 
            erb :'sneakers/index'
    end

    #new action
    get '/sneakers/new' do
        erb :'sneakers/new'
    end

    #create action
     post '/sneakers' do 
        if params[:sneaker_name] != ""
            @sneaker = current_user.sneakers.create(params)
            redirect "/sneakers/#{@sneaker.id}"
        else
            @error = 'you messed up'
            redirect 'sneakers/new'
        end
     end

    #show action 

    get '/sneakers/:id' do
        @sneaker = Sneaker.find(params[:id])
        if @sneaker
            erb :'sneakers/show'
        else
            redirect "/sneakers"
        end
    end
    

    #edit action(view for form that will update)

    #update action 
    
    #delete action 
    
end
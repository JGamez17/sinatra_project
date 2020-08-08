class SneakerController < ApplicationController

    #index action: list all sneakers
    get '/sneakers' do 
        if current_user
            @sneaker = current_user.sneakers 
            erb :'sneakers/index'
        else    
            @error_message = 'You must be logged in to do that'
            erb :'users/login'
        end 
    end

    #new action
    get '/sneakers/new' do
        erb :'sneakers/new'
    end

    #create action
     post '/sneakers' do 
        # binding.pry
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
        @sneaker = current_user.sneakers.find_by_id(params[:id])
        if @sneaker
            erb :'sneakers/show'
        else
            redirect "/sneakers"
        end
    end
    
    #edit action(view for form that will update)
    get '/sneakers/:id/edit' do
        set_sneaker
        erb :'/sneakers/edit'
    end
    
    #update action 
    patch '/sneakers/:id' do 
        params.delete(:_method)
        set_sneaker
        @sneaker.update(params)
        redirect '/sneakers'
    end

    #delete action 
    delete '/sneakers/:id' do
        set_sneaker
        @sneaker.destroy
        redirect '/sneakers'
    end

    private #private methods are for internal usage within the defining class
    def set_sneaker
        @sneaker = current_user.sneakers.find_by_id(params[:id])
    end
end
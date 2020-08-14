class ApplicationController < ActionController::Base

   # before_action :authenticate_user!
    #helper_method :set_world, :set_character, :set_plot
    helper_method :set_world, :set_character, :set_plot

    def home 
    end 

    def index
        before_action :authenticate_user!
        before_action :set_world, except: [:index, :new, :create, :show, :destroy]
        #@user = User.find_by(id: params[:id])
        
        if params[:id] == "my-worlds"
            @worlds = World.all
        end
           
    end

    def set_world
        @world = World.find(params[:id])
    end

    def set_character
        @character = Character.find(params[:id])
    end

    def set_plot
        @plot = Plot.find(params[:id])
    end


end

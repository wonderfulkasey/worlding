class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, :only => [:home]
    
    #helper_method :set_world, :set_character, :set_plot
    helper_method :set_world, :set_character, :set_plot


    def home 
        
    end 

    def index
      #@user = User.find_by(id: params[:id])
      

        if params[:id] == "my-worlds"
            redirect_to application_index_path
            @worlds = current_user.worlds
        end
           
    end

    def self.my_worlds
        @worlds = current_user.worlds
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

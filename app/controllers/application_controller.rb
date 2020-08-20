class ApplicationController < ActionController::Base
   # before_action :authenticate_user!
   # skip_before_action :authenticate_user!, :only => [:home]
    
    #helper_method :set_world, :set_character, :set_plot
   # helper_method :set_world, :set_character, :set_plot


    def home
    end 

    def profile
        @user = User.find_by_name(params[:name])
        @worlds = @user.worlds
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

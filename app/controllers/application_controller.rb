class ApplicationController < ActionController::Base

    helper_method :set_world, :set_character, :set_plot

    def home
        
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

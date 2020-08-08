class ApplicationController < ActionController::Base

    before_action :authenticate_user!
    helper_method :set_world, :set_character, :set_plot

    def home  
    end 

end

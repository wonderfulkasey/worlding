class PlotsController < ApplicationController
   # include ApplicationHelper

    before_action :authenticate_user!
    before_action :set_world
    before_action :set_plot, except: [:index, :new, :create, :show, :destroy]

    def index
        redirect_to worlds_path(@worlds)
    end

    def show
       # @plot = plot.find(params[:id])
        set_plot
    end

    def new
        @plot = @world.plots.build
    end

    def create
        @plot = Plot.new(plot_params)
        #@plot = current_user.plots.build(plot_params)
        @plot.user_id = current_user.id

          if @plot.valid?
            @plot.save
            redirect_to worlds_path(@plot)
          else
            flash[:errors] = @plot.errors.full_messages
            render :new
        end
    end

    def edit
       @plot = Plot.find(params[:id])
    end

    def update
        #@plot.update(plot_params)
        @plot = Plot.find(params[:id])
        
        if @plot.update(plot_params)
            redirect_to worlds_path(@worlds)
        else
            flash[:errors] = @plot.errors.full_messages
            render :edit
        end
    end

    def destroy
        @plot = Plot.find(params[:id])
        @plot.destroy

        redirect_to plots_path 
    end

    private 

    def plot_params
        params.require(:plot).permit(
            :title,
            :importance,
            :description,
            :user_id,
            :world_id
        )
    end

    def set_world
        @world = World.find_by(id:params[:world_id])
    end

end

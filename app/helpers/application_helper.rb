module ApplicationHelper

    def set_world(world)
        world = World.find(params[:id])
    end

    def set_character(character)
        character = Character.find(params[:id])
    end

    def set_plot(plot)
        plot = Plot.find(params[:id])
    end

end

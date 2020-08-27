class CharactersController < ApplicationController
   # include ApplicationHelper

    before_action :authenticate_user!
    before_action :set_world
    before_action :set_character, except: [:index, :new, :create, :show, :destroy]

    def index
        redirect_to worlds_path(@worlds)
    end

    def show
       # @character = Character.find(params[:id])
        set_character
    end

    def new
        @character = @world.characters.build
    end

    def create
        @character = Character.new(character_params)
        #@character = current_user.characters.build(character_params)
        @character.user_id = current_user.id

          if @character.valid?
            #match all the processes
            @character.save
            #byebug
            redirect_to world_character_url(@character.world, @character)
  # redirect_to worlds_path(@worlds)
          
        else
            flash[:errors] = @character.errors.full_messages
            render :new
        end
    end

    def edit
       @character = Character.find(params[:id])
    end

    def update
        #@character.update(character_params)
        @character = Character.find(params[:id])
        @character.user_id = current_user.id

        if @character.update(character_params)
            redirect_to world_character_url(@character.world, @character)
           # redirect_to worlds_path(@worlds)
        else
            flash[:errors] = @character.errors.full_messages
            render :edit
        end
    end

    def destroy
        @character = Character.find(params[:id])
        @character.destroy

       # redirect_to worlds_path(@world)
        redirect_to world_url(@character.world)

    end

    private 

    def character_params
        params.require(:character).permit(
            :name,
            :alignment,
            :species,
            :character_class,
            :description,
            :user_id,
            :world_id
        )
    end

    def set_world
        @world = World.find_by(id:params[:world_id])
    end

end

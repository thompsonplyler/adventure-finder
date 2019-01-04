class CharactersController < ApplicationController
    before_action :authentication_required

    def new
         @character = Character.new
    end

    def create
        @character = Character.new(character_params)
        @character.user_id = current_user.id
        @character.save
        redirect_to users_path
    end

    def index
        @characters = Character.all
    end

    def show
        @character = Character.find(params[:id])
    end


    def edit
        @character = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])
        @character.update(character_params)
        redirect_to character_path
    end

    def adventure
        @campaigns = Campaign.all
        @character = Character.find(params[:id])
    end

    def destroy
        @character = Character.find(params[:id])
        @character.destroy
        redirect_to users_path
    end

    private
    
    def character_params
        params.require(:character).permit(:name, :level, :race, :char_class, :alignment)
    end
end

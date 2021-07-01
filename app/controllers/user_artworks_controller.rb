class UserArtworksController < ApplicationController


    def index
        @user_artwork = UserArtwork.all
        render json: @user_artwork
    end

    def show 
        @user_artwork = UserArtwork.find params[:id]
        render json: @user_artwork
    end

    


end

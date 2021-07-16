class ArtworksController < ApplicationController

    def index
        @artwork = Artwork.all
        render json: @artwork
    end

    def show 
        @artwork = Artwork.find params[:id]
        render json: @artwork
    end

    def create
        @artwork = Artwork.create(title: params[:title], image: params[:image]) 
        if @artwork.valid? 
            @artwork.save
            render json: @artwork, status: :created
        else
            render json: {errors: @artwork.errors.full_messages}, status: :unprocessible_entity
        end
    end
    
    def update 
       @artwork = Artwork.find params[:id]
       @artwork.update title: params[:title], image: params[:image]
    end

    def destroy
        @artwork = Artwork.find params[:id]
        @artwork.destroy
        render json: {message: "successfully deleted user"} 
    end 

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image )
        # params.require(:artwork).permit(:title, :image: [], :upload_image  )
    end
    



end

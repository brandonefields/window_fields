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
        @artwork.update(artwork_params)
        # @artwork = Artwork.update(title: params[:title], image: params[:image])
        if @artwork.update(artwork_params), status: :updated
            render json: @artwork
        else
            render json: {errors: @artwork.errros.full_messages}, status: :bad_request
        end
    end

    def destroy
        @artwork = Artwork.find params[:id]
        @artwork.destroy
        render json: {message: "successfully deleted user"} 
    end 

    private

    def artwork_params
        params.require(:artwork).permit(:title,:image)
    end
    



end

class UsersController < ApplicationController

    def index
        @user = User.all
        render json: @user
    end

    def show 
        @user = User.find params[:id]
        render json: @user
    end

    def create
        @user = User.create(name: params[:name], photo: params[:photo]) 
        if @user.valid? 
            @user.save
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
        end
    end

    def update 
        @user = User.find params[:id]
        @user.update(user_params)
        # @user = User.update(name: params[:name], photo: params[:photo])
        if @user.update(user_params)
            render json: @user
        else
            render json: {errors: @user.errros.full_messages}, status: :updated
        end
    end

    def destroy
        @user = User.find params[:id]
        @user.destroy
        render json: {message: "successfully deleted user"} 
    end 

    private

    def user_params
        params.require(:user).permit(:name,:photo)
    end
    
end

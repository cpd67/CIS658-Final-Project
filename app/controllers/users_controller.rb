class UsersController < ApplicationController
    before_action :set_user, only [:update, :destroy]

    def create
        @user = User.new(user_params)

        if @user.save
            json_response(@user, :created) 
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update
        @user.update(user_params)
        head :no_content
    end

    def destroy
        @user.destroy
        head :no_content
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.permit(:id, :first_name, :last_name, :email, :username, :password, :password_confirmation)
        end
end

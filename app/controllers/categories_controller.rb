# Handles request for Category information
class CategoriesController < ApplicationController
    before_action :set_user
    before_action :set_user_post, only: [:show, :update, :destroy]

    def index
        render json: @user.categories.as_json(:except => [:user_id])
    end

    def show
        render json: @category.as_json(:except => [:user_id])
    end

    def create
        @user.categories.create!(category_params)
        json_response(@user, :created)
    end

    def update
        @category.update(category_params)
        head :no_content
    end

    def destroy
        @category.destroy
        head :no_content
    end

    private
        def category_params
            params.permit(:id, :name, :user_id)
        end
        
        def set_user
            @user = User.find(params[:user_id])
            if !authorized_user?
                render json: {status: 401, errors: ["You cannot do that."]}
            end
        end

        def set_user_post
            @category = @user.categories.find_by!(id: params[:id])
        end
end

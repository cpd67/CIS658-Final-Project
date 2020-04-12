class UsersController < ApplicationController
    def index
    end

    def create
    end

    def show
    end

    def update
    end

    def destroy
    end

    private
        def user_params
            params.permit(:id, :first_name, :last_name, :email)
        end
end

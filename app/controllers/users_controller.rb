# Agile Web Development with Rails 6 by Sam Ruby & Dave Bryant Copeland
# https://medium.com/how-i-get-it/react-with-rails-user-authentication-8977e98762f2
class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def create
        # Create the user and log them in
        @user = User.new(user_params)

        if @user.save
            login!
            render json: {user: @user.as_json(:except => [:password_digest]), errors: []}
        else
            render json: {user: {}, errors: @user.errors, status: :unprocessable_entity}
        end
    end

    def show
        # Show details about the user
        render json: @user.as_json(:except => [:password_digest])
    end

    def update
        # Update the User's information
        @user.update(user_params)
        head :no_content
    end

    def destroy
        # Destroy the User
        @user.destroy
        head :no_content
    end

    private
        def set_user
            # Set the current user. Only allow if the currently logged-in User is viewing their own information.
            @user = User.find(params[:id])
            if !authorized_user?
                render json: {status: 401, errors: ["You cannot do that."]}
            end
        end

        def user_params
            params.permit(:first_name, :last_name, :username, :password, :password_confirmation)
        end
end

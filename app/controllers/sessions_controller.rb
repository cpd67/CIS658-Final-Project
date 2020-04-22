# Handles sessions for logged-in users
# The following resources were helpful when writing this controller:
# Agile Web Development with Rails 6 by Sam Ruby & Dave Bryant Copeland
# https://medium.com/how-i-get-it/react-with-rails-user-authentication-8977e98762f2
class SessionsController < ApplicationController

  def create
    # Attempt to authenticate the User and log them in.
    @user = User.find_by(username: params[:username])
    if @user.try(:authenticate, params[:password])
      login!
      json_response({logged_in: true, user: @user.as_json(except: [:password_digest])})
    else
      json_response({errors: ['Username or password is incorrect. Please try again.']}, 401);
    end
  end

  def is_logged_in?
    # Check if the User is currently logged-in
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user.as_json(except: [:password_digest])
      }
    else
      render json: {
        logged_in: false,
      }
    end
  end

  def destroy
    # Log the user out
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end
end

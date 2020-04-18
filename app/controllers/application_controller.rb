# https://medium.com/how-i-get-it/react-with-rails-user-authentication-8977e98762f2
class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    def login!
        session[:user_id] = @user.id
    end

    def logged_in?
        !!session[:user_id]
    end

    def logout!
        session.clear
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if logged_in?
    end
end

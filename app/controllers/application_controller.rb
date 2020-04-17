# https://medium.com/how-i-get-it/react-with-rails-user-authentication-8977e98762f2
class ApplicationController < ActionController::API
    before_action :authorize

    include Response
    include ExceptionHandler

    def login!
        session[:user_id] = @user.id
    end

    def logged_in?
        session[:user_id].nil?
    end

    def logout!
        session.clear
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if logged_in?
    end

    protected
        def authorize
            # https://stackoverflow.com/questions/2075645/rails-return-a-401
            # https://stackoverflow.com/questions/28119606/respond-with-a-status-unauthorised-401-with-rails-4
            # Agile Web Development with Rails 6 by Sam Ruby & Dave Bryant Copeland
            if logged_in?
                if params[:user_id]
                    user = User.find_by(id: params[:user_id])
                    if !user || current_user != user
                        # Can't attempt to look at another user's information
                        render json: {status 401, errors: ["You cannot view another user's information."]}
                    end
                end
            else
                # You need to be logged-in
                render json: {status: 401, errors: ["You must login to view this information."]}
            end
        end
end

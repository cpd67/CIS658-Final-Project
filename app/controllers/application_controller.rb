class ApplicationController < ActionController::API
    before_action :authorize

    include Response
    include ExceptionHandler

    protected
        def authorize
            # https://stackoverflow.com/questions/2075645/rails-return-a-401
            # Agile Web Development with Rails 6 by Sam Ruby & Dave Bryant Copeland
            unless User.find_by(id: session[:user_id])
                head :unauthorized
            end
        end
end

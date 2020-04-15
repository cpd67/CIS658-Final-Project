class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.user_id
    else
      session[:user_id] = nil
    end
  end

  def destroy
    session[:user_id] = nil
  end
end

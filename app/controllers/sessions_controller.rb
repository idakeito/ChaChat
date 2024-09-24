class SessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      @current_user = user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if logged_in?
      session.delete(:user_id)
      @current_user = nil
    end
    redirect_to root_path
  end

end

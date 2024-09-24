class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  def current_user
    if session[:user_id]
      @current_user  = User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  private

    def login_required
      redirect_to signin_url unless logged_in?
    end
end

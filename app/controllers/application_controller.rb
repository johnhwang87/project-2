class ApplicationController < ActionController::Base

helper_method :current_user
protect_from_forgery with: :exception

protected
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def authorize
    unless current_user
      flash[:error] = "You must sign in first!"
      redirect_to new_session_path
    end
  end

end

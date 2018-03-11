class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Let the methods be used by the views
  helper_method :current_user , :logged_in?

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
      !!current_user
  end

  def require_user
      if !logged_in?
          fash[:danger] = "You must be logged in to perform this action"
          redirect_to root_path
      end
  end

end

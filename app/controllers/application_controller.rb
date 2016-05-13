class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :is_chef?, :is_cook?, :is_client?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def is_chef?
    if logged_in? && current_user.role == 1
      return true
    else
      return false
    end
  end

  def is_cook?
    if logged_in? && current_user.role == 2
      return true
    else
      return false
    end
  end

  def is_client?
    if logged_in? && current_user.role == 3
      return true
    else
      return false
    end
  end

end

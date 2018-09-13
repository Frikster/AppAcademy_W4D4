#current_user to return the current user.
#logged_in? to return a boolean indicating whether someone is signed in.
#log_in_user!(user) reset the users session token and cookie

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user # wont this have the val of prev logged_in current_user?
    # request cycle ends when user logs out due to redirect_to
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
    # debugger
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end
end

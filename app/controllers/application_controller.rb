# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  #filter_parameter_logging :password
  helper_method :current_user

  private
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "Trebuie sa fiti autentificat pentru a accesa aceasta pagina"
      redirect_to :controller => "user_sessions", :action => "new"
      return false
    end
  end
  
  def require_admin
    if current_user.nil? || current_user.role != "admin"
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to :controller => "users", :action => "index"
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end

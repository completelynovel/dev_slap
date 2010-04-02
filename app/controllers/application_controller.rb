class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private
    helper_method :logged_in?
    def logged_in?
      current_user.present? && !current_user.new_record?
    end
    
    def store_current_location
      session[:return_to] = request.fullpath
    end
    
    def store_location(path)
      session[:return_to] = path if path.present?
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = PersonSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
end

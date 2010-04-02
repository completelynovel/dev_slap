class BackendResourceController < ApplicationController
  
  layout 'backend'
  
  before_filter :login_required
  
  private
    
    def login_required
      unless logged_in?
        store_current_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_path
      end
    end
end

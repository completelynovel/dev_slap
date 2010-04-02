class PersonSessionsController < ApplicationController
  
  layout 'backend'
  
  def new
    @person_session = PersonSession.new
  end
  
  def create
    @person_session = PersonSession.new(params[:person_session])
    if @person_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to person_path(current_user)
    else
      render :action => 'new'
    end
  end

  def destroy
    @person_session = PersonSession.find
    @person_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end

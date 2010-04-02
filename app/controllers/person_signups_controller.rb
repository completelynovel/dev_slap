class PersonSignupsController < ApplicationController
  
  layout 'backend'
  
  def new
    @person = Person.new
  end
  
  def create
    logger.info "Creating person"
    @person = Person.new(params[:person])
    logger.info @person.inspect
    if @person.save
      flash[:notice] = "Successfully signed up."
      redirect_to person_path(current_user)
    else
      render :action => 'new'
    end
  end
end

class WebsiteWidgetController < ApplicationController
  
  layout 'widget'

  before_filter :set_website
  before_filter :set_people
  before_filter :set_slapper_count
  
  def show
    
  end
  
  private
  
    def set_website
      @website = Website.find(params[:website_id])
    end
    
    def set_people
      #@people = @website.people
      @people = Person.all
    end
    
    def set_slapper_count
      #@slapper_count = @website.slappers.count
      @slapper_count = 10
    end
  
end
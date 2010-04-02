class WebsiteWidgetController < ApplicationController
  
  layout 'widget'

  before_filter :set_website
  before_filter :set_slapper_count
  
  def show
    @website_people = @website.website_people
  end
  
  private
  
    def set_website
      @website = Website.find(params[:website_id])
    end
    
    def set_slapper_count
      #@slapper_count = @website.slappers.count
      @slapper_count = 10
    end
  
end

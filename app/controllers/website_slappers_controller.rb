class WebsiteSlappersController < ApplicationController

  before_filter :set_website
  
  def create
    respond_to do |format|
      format.json do
        @slapper = Slapper.new(params[:slapper])
        @slapper.website = @website
        
        if @slapper.save
          render :json => { :status => "yes" }.to_json
        else
          render :json => { :status => "nop" }.to_json
        end
      end
    end
  end
  
  private
  
    def set_website
      @website = Website.find(params[:website_id])
    end
  
end
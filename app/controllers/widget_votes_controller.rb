class WidgetVotesController < ApplicationController

  before_filter :set_website
  
  def create
    render :text => "hello"
  end
  
  private
  
    def set_website
      @website = Website.find(params[:id])
    end
  
end
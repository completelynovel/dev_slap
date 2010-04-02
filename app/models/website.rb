class Website < ActiveRecord::Base
  
  # ------------------ Associations -----------------------
  has_many :website_people, :dependent => :destroy, :class_name => "WebsitePerson"
  has_many :people, :through => :website_people
  has_many :slappers
  
  # ------------------ Validations -------------------------
  validates_presence_of :url, :name, :description
  
  
  def embed_code
    "<script type=\"text/javascript\">document.write('<iframe src=\"#{CONFIG['site_url']}/websites/#{self.id}/widget\" style=\"width:1000px; height:1000px;\"></iframe>');</script>"
  end
end

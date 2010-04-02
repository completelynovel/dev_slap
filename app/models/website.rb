class Website < ActiveRecord::Base
  
  # ------------------ Associations -----------------------
  has_many :website_people, :dependent => :destroy, :class_name => "WebsitePerson"
  has_many :people, :through => :website_people
  has_many :slappers
  
  # ------------------ Validations -------------------------
  validates_presence_of :url, :name, :description
  
end

class Website < ActiveRecord::Base
  
  # ------------------ Associations -----------------------
  has_many :people, :through => 'website_people'
  has_many :website_people, :as => :website
  
  # ------------------ Validations -------------------------
  validates_presence_of :url, :name, :description
  
  
end

class Slap < ActiveRecord::Base
  
  belongs_to :slapper
  belongs_to :website_person, :foreign_key => :person_id
  
end

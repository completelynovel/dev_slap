class Slap < ActiveRecord::Base
  
  belongs_to :slapper
  belongs_to :person
  
end

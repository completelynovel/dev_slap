class Slapper < ActiveRecord::Base
  
  belongs_to :website
  has_many :slaps
  
end

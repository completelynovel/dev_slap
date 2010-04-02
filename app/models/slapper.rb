class Slapper < ActiveRecord::Base
  
  belongs_to :website
  has_many :slaps
  
  def people_slap_number=(people)
    people.each do |person_id, number|
      self.slaps << Slap.new do |slap|
        slap.person  = Person.find(person_id)
        slap.slapper = self
        slap.number  = number
      end
    end
  end
  
end

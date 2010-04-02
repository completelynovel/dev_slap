class Slapper < ActiveRecord::Base
  
  belongs_to :website
  has_many :slaps
  
  def people_slap_number=(website_people)
    website_people.each do |website_person_id, number|
      self.slaps << Slap.new do |slap|
        slap.website_person  = WebsitePerson.find(website_person_id)
        slap.slapper = self
        slap.number  = number
      end
    end
  end
  
end

class WebsitePerson < ActiveRecord::Base
  belongs_to :person, :foreign_key => 'person_id'
  belongs_to :website, :foreign_key => 'website_id'
end

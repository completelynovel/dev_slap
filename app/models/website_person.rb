class WebsitePerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :website
end

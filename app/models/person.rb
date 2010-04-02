class Person < ActiveRecord::Base
  
  # ----------------- Authentication ------------------
  acts_as_authentic do |c|
    c.login_field                      :email
  end
  
  # ----------------- Associations --------------------
  has_many :website_people, :dependent => :destroy, :class_name => "WebsitePerson"
  has_many :websites, :through => :website_people
  
  
  def fellows
    Person.find(:all, :include => :website_people, :conditions => ["website_people.website_id IN(?) AND people.id != ?", self.websites.collect{|ws| ws.id}, self.id])
  end
  
  def fellow_devlopers
    WebsitePerson.find(:all, :include => :person, :conditions => ["website_people.website_id IN(?) AND people.id != ?", self.websites.collect{|ws| ws.id}, self.id])
  end
  
  # ------------------ Validations ---------------------
  # Most validations created by authlogic
  
  
  def self.newpass( len = 10 )
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    newpass
  end
                                    
end

class Person < ActiveRecord::Base
  
  # ----------------- Authentication ------------------
  acts_as_authentic do |c|
    c.login_field                      :email
  end
  
  # ----------------- Associations --------------------
  has_many :websites, :through => :website_people
  has_many :website_people, :as => :person
  
  has_many :slaps
  
  # ------------------ Validations ---------------------
  # Most validations created by authlogic
  
                                    
  #validates_attachment_presence :normal_picture, :message => "please upload a picture to represent your competition"

  # ------------------ Plugin Declarations -------------
  has_attached_file :normal_picture,
                    :styles => CONFIG['image_sizes']
  
  #validates_attachment_content_type :normal_picture, :content_type => ['image/pjpeg', 'image/jpeg', 'image/jpg', 'x-application/JPG', 'image/gif', 'image/png'],
  #                                  :message => "- please try another image - we can only use jpeg, jpg, gif or png."
                                    
                                    
  has_attached_file :slapped1_picture, 
                    :styles => CONFIG['image_sizes']
  
  #validates_attachment_content_type :slapped1_picture, :content_type => ['image/pjpeg', 'image/jpeg', 'image/jpg', 'x-application/JPG', 'image/gif', 'image/png'],
  #                                  :message => "- please try another image - we can only use jpeg, jpg, gif or png."
end

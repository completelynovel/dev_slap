class WebsitePerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :website
  
  has_many :slaps, :foreign_key => :person_id, :dependent => :destroy
  
  validates_attachment_presence :normal_picture, :message => "please upload a picture to represent your competition"
  validates_attachment_presence :slapped1_picture, :message => "please upload a picture to represent your competition"
  
  #validates_presence_of :person_id, :website_id

  # ------------------ Plugin Declarations -------------
  has_attached_file :normal_picture,
                    :styles => CONFIG['image_sizes']
  
  #validates_attachment_content_type :normal_picture, :content_type => ['image/pjpeg', 'image/jpeg', 'image/jpg', 'x-application/JPG', 'image/gif', 'image/png'],
  #                                  :message => "- please try another image - we can only use jpeg, jpg, gif or png."
                                    
                                    
  has_attached_file :slapped1_picture, 
                    :styles => CONFIG['image_sizes']
  
  #validates_attachment_content_type :slapped1_picture, :content_type => ['image/pjpeg', 'image/jpeg', 'image/jpg', 'x-application/JPG', 'image/gif', 'image/png'],
  #                                  :message => "- please try another image - we can only use jpeg, jpg, gif or png."
  
  
  def slap_total
    self.slaps.sum(:number)
  end
end

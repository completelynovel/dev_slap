class AddDetailsToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      
      t.string    :password_salt
      t.string    :crypted_password
      t.string    :persistence_token
      t.string    :single_access_token
      t.string    :perishable_token
      t.integer   :login_count
      t.integer   :failed_login_count
      t.datetime  :last_login_at
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      
      
      t.string    :normal_picture_file_name
      t.string    :normal_picture_content_type
      t.integer   :normal_picture_file_size
      t.datetime  :normal_picture_updated_at
      
      t.string    :slapped1_picture_file_name
      t.string    :slapped1_picture_content_type
      t.integer   :slapped1_picture_file_size
      t.datetime  :slapped1_picture_updated_at
    end
  end

  def self.down
    change_table :people do |t|
      
      t.remove  :password_salt
      t.remove  :crypted_password
      t.remove  :persistence_token
      t.remove  :single_access_token
      t.remove  :perishable_token
      t.remove  :login_count
      t.remove  :failed_login_count
      t.remove  :last_login_at
      t.remove  :last_request_at
      t.remove  :current_login_at
      t.remove  :current_login_ip
      t.remove  :last_login_ip
      
      
      t.remove  :normal_picture_file_name
      t.remove  :normal_picture_content_type
      t.remove  :normal_picture_file_size
      t.remove  :normal_picture_updated_at
      t.remove  :slapped1_picture_file_name
      t.remove  :slapped1_picture_content_type
      t.remove  :slapped1_picture_file_size
      t.remove  :slapped1_picture_updated_at
    end
  end
end

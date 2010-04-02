class MovePersonInfoAround < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.remove  :description
      t.remove  :role
      t.remove  :name
      t.remove  :normal_picture_file_name
      t.remove  :normal_picture_content_type
      t.remove  :normal_picture_file_size
      t.remove  :normal_picture_updated_at
      t.remove  :slapped1_picture_file_name
      t.remove  :slapped1_picture_content_type
      t.remove  :slapped1_picture_file_size
      t.remove  :slapped1_picture_updated_at
    end
    
    change_table :website_people do |t|
      
      t.string    :role
      t.text      :description
      t.string    :name
      
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
  end
end

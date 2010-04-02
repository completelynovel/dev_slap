class AddWebsitePeople < ActiveRecord::Migration
  def self.up
    create_table :website_people do |t|
      t.integer :person_id
      t.integer :website_id
    end
    
    add_index :website_people, :person_id
    add_index :website_people, :website_id
  end

  def self.down
    drop_table :website_people
  end
end

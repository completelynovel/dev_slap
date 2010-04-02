class AddSession < ActiveRecord::Migration
  def self.up
    create_table :person_session do |t|
      t.string :session_id
      t.text :data
      t.timestamps
    end
  end

  def self.down
    drop_table :person_session
  end
end

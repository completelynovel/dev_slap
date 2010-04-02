class CreateSlaps < ActiveRecord::Migration
  def self.up
    create_table :slaps do |t|
      t.integer :person_id
      t.integer :slapper_id
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :slaps
  end
end

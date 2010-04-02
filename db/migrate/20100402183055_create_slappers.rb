class CreateSlappers < ActiveRecord::Migration
  def self.up
    create_table :slappers do |t|
      t.string :name
      t.string :email
      t.boolean :apology, :default => true
      t.text :feedback
      t.integer :website_id

      t.timestamps
    end
  end

  def self.down
    drop_table :slappers
  end
end

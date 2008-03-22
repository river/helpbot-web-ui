class CreateTriggers < ActiveRecord::Migration
  def self.up
    create_table :triggers do |t|
      t.integer :channel_id
      t.integer :admin_id
      t.string :question
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :triggers
  end
end

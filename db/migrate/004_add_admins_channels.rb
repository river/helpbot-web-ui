class AddAdminsChannels < ActiveRecord::Migration
  def self.up
    create_table :admins_channels, :id => false do |t|
      t.integer :admin_id
      t.integer :channel_id
    end
  end

  def self.down
    drop_table :admins_channels
  end
end

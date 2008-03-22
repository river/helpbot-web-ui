class Trigger < ActiveRecord::Base
  belongs_to :channel
  belongs_to :admin
  
  validates_presence_of :channel_id, :admin_id, :question, :answer
  
  def admin_login
    Admin.find(self.admin_id).login
  end
  
  def channel_name
    Channel.find(self.channel_id).name
  end
end

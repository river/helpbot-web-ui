class Trigger < ActiveRecord::Base
  belongs_to :channel
  belongs_to :admin
  
  validates_presence_of :question, :answer, :channel_id
  
  def admin_login
    Admin.find(self.admin_id).login
  end
  
  def channel_name
    Channel.find(self.channel_id).name
  end
end

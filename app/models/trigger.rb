class Trigger < ActiveRecord::Base
  belongs_to :channel
  belongs_to :admin
  
  # TODO: validate presence of admin_id and channel_id as well (need to make multiselect box first)
  validates_presence_of :question, :answer
  
  def admin_login
    Admin.find(self.admin_id).login
  end
  
  def channel_name
    Channel.find(self.channel_id).name
  end
end

class Trigger < ActiveRecord::Base
  belongs_to :channel
  belongs_to :admin
  
  validates_presence_of :channel_id, :admin_id, :question, :answer
end

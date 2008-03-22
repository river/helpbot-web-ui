class Channel < ActiveRecord::Base
  has_many :triggers
  has_and_belongs_to_many :admins
  
  validates_presence_of :name, :channel_wins, :public
end

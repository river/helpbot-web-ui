class Channel < ActiveRecord::Base
  has_many :triggers, :dependent => :destroy
  has_and_belongs_to_many :admins
  
  validates_presence_of :name
  
  def all_admins
    Admin.find_by_global(true).to_a + self.admins.find(:all)
  end
  
  def all_admin_ids
    ((Admin.find_by_global(true).to_a.collect {|a| a.id }) + self.admin_ids).sort
    # TODO: Remove an admin's channels when he/she becomes global, and vice versa
  end
end

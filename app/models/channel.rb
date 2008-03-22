class Channel < ActiveRecord::Base
  has_many :triggers
  has_and_belongs_to_many :admins
  
  validates_presence_of :name
  
  helper_method :admin_logins
  
  def admin_logins
    self.admins.each do |admin|
      return admin.login
    end
  end
end

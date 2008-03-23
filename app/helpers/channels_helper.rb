module ChannelsHelper
  
  def admin_logins
    self.admins.each do |admin|
      return admin.login
    end
  end
end

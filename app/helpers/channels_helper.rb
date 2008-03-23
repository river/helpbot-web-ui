module ChannelsHelper
  
  def admin_logins
    @channel.admins.each do |admin|
      return admin.login
    end
  end
end

module ChannelsHelper
  
  def admin_logins
    @channel.admins.each do |admin|
      puts admin.name+" "
    end
  end
  
end

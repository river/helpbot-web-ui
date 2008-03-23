module ChannelsHelper
  
  def admin_logins
    @channel.admins.each do |admin|
      puts admin.login+" "
    end
  end
end

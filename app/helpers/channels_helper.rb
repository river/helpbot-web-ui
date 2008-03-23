module ChannelsHelper
  
  def admin_logins(channel_id)
    channel = Channel.find(channel_id)
    channel.admins.each do |admin|
      puts admin.longest_name + ", "
    end
  end
  
end

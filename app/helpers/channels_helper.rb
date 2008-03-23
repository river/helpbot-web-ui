module ChannelsHelper
  
  # TODO: fix this so that the #<Admin> thing goes away. Also automatically include all global admins and make the list look nice (e.g.: first admin, second admin and third admin)
  def admin_logins(channel_id)
    channel = Channel.find(channel_id)
    channel.admins.each do |admin|
      puts admin.longest_name + ", "
    end
  end
  
end

module AdminsHelper

  def admin_of
    @admin.channels.each do |chan|
      puts chan.name+" "
    end
  end
  
end

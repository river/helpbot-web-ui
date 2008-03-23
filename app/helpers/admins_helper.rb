module AdminsHelper

  def admin_of
    @admin.channels.each do |chan|
      if chan.empty?
        puts "Nothing"
      else
        puts chan.name+" "
      end
    end
  end
  
end

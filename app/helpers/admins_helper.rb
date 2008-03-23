module AdminsHelper

  def admin_of
    @admin.channels.each do |chan|
      if chan == []
        puts "<i>Nothing</i>"
      else
        puts chan.name+" "
    end
  end
end

module AdminsHelper

  def admin_of
    @admin.channels.each do |chan|
      if chan == nil
        puts "<i>Nothing</i>"
      else
        puts chan.name+" "
    end
  end
end

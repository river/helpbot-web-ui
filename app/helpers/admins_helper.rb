module AdminsHelper

  def is_global?
    @admin.global
  end

  def admin_of
    @admin.channels.each do |chan|
      if chan.empty?
        puts "<i>Nothing</i>"
      else
        puts chan.name+" "
      end
    end
  end
end

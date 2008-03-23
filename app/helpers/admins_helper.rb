module AdminsHelper

  def admin_of
    @admin.channels.each do |chan|
      return chan.name
    end
  end
end

module AdminsHelper

  def admin_of
    self.channels.each do |chan|
      return chan.name
    end
  end
end

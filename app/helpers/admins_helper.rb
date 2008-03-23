module AdminsHelper

  def admin_of
    @admin.channels.each do |chan|
      puts chan.name+" "
    end
  end
  
  def am_myself?
    return if @current_admin.id != @admin.id && !@current_admin.global || !logged_in?
  end
end

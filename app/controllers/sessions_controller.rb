class SessionsController < ApplicationController

  def new 
  end 

  def create 
    @current_admin = Admin.authenticate(params[:login], params[:password]) 
    if @current_admin 
      session[:admin] = @current_admin.id 
      redirect_to :controller => "admins", :action => "show", 
      										:id => @current_admin.id 
    else 
      flash[:notice] = "No user was found with this login/password" 
      render :action => 'new' 
    end 
  end
  
  def destroy 
    reset_session 
    flash[:notice] = "Logged out successfully" 
    redirect_to :action => "new" 
  end
end

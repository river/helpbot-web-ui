class SessionsController < ApplicationController

  def new 
  end 

  def create 
    @current_admin = Admin.authenticate(params[:login], params[:password]) 
    if @current_admin
      session[:admin] = @current_admin.id
      # TODO: Add a "longest_name" helper that will return the name if set, or the login
      flash[:notice] = "Welcome, " + @current_admin.login + "!"
      redirect_to root_url
    else 
      flash[:notice] = "No user was found with this login/password" 
      render :action => 'new' 
    end 
  end
  
  def destroy 
    reset_session 
    flash[:notice] = "You were logged out successfully." 
    redirect_to :action => "new" 
  end
end

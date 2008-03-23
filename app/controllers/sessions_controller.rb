class SessionsController < ApplicationController

  def new 
  end 

  def create 
    @current_admin = Admin.authenticate(params[:login], params[:password]) 
    if @current_admin
      session[:admin] = @current_admin.id
      flash[:notice] = "Welcome, " + @current_admin.longest_name + "!"
      redirect_to root_url
    else 
      flash[:notice] = "Incorrect login or password. Please try again." 
      render :action => 'new' 
    end 
  end
  
  def destroy 
    reset_session 
    flash[:notice] = "You were logged out successfully." 
    redirect_to :action => "new" 
  end
end

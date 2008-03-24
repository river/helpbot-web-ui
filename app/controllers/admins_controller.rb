class AdminsController < ApplicationController
  before_filter :find_admin, :except => [:index, :new, :create]
  before_filter :has_permission?, :except => [:index, :show, :new, :create]
  
  def index
    @admins = Admin.find(:all, :order => "name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admins }
    end
  end
  
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    @admin.global = false
    
    respond_to do |format|
      if @admin.save
        if @admin.id == 1
          @admin.update_attributes(:global => true)
        else
          @admin.update_attributes(:global => true) if Admin.find(:all).size == 1
        end
        
        flash[:notice] = "Admin was successfully created. Welcome, " + @admin.longest_name + "!"
        session[:admin] = @admin.id
        format.html { redirect_to(@admin) }
        format.xml  { render :xml => @admin, :status => :created, :location => @admin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    
    # If you aren't global, any admin you can edit should not be global, either
    params[:admin][:global] = false unless @current_admin.global
    
    @admin.attributes = params[:admin]
    @admin.channel_ids = params[:channels]

    respond_to do |format|
      if @admin.save
        flash[:notice] = 'Admin was successfully updated.'
        format.html { redirect_to(@admin) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    if is_global? or @admin == @current_admin
      unless @admin.global and Admin.find_by_global(true).to_a.size == 1
        @admin.destroy
        message = @admin.longest_name + " was sucessfully deleted."
    
        if Admin.find(:all).size == 1
          last_admin = Admin.find(:first)
          unless last_admin.global
            last_admin.update_attributes(:global => true)
            message << " " + last_admin.longest_name + " was also made global because he/she is now the last admin remaining."
          end
        end
        
        flash[:notice] = message
      else
        flash[:warning] = "You cannot delete yourself right now because you are the last global admin! Please make someone else global first, then try again."
      end
    else
      flash[:message] = "Nice try, but you don't have permission to delete " + @admin.longest_name + "."
    end
    
    respond_to do |format|
      format.html { redirect_to(admins_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_admin
      @admin = Admin.find(params[:id])
    end
    
    def has_permission?
      redirect_to login_path unless logged_in?
      @current_admin.global or @admin.id == @current_admin.id
    end
end

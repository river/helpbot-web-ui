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

  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin }
    end
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
        
        flash[:notice] = 'Admin was successfully created.'
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
  end
  
  def update
    
    respond_to do |format|
      if @admin.update_attributes(params[:id])
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
    @admin.destroy unless @admin.global

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
      redirect_to "/login" unless logged_in?
      logged_in? and (@current_admin.global or @admin.id == @current_admin.id)
    end
end

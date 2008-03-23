class TriggersController < ApplicationController
  before_filter :find_trigger_channel, :except => [:index, :new, :create]
  before_filter :has_permission?, :except => [:index, :show]
  
  # def index
  #     @triggers = Channel.find(params[:channel_id]).triggers
  # 
  #     respond_to do |format|
  #       format.html 
  #       format.xml  { render :xml => @triggers }
  #     end
  #   end
  # 
  #   def show
  # 
  #     respond_to do |format|
  #       format.html
  #       format.xml  { render :xml => @trigger }
  #     end
  #   end
  # 
  #   def new
  #     @trigger = Trigger.new
  #     
  #     respond_to do |format|
  #       format.html 
  #       format.xml  { render :xml => @trigger }
  #     end
  #   end
  # 
  #   def create
  #     @trigger = Trigger.new(params[:trigger])
  #     
  #     respond_to do |format|
  #       if @trigger.save
  #         flash[:notice] = 'Trigger was successfully created.'
  #         format.html { redirect_to(@trigger) }
  #         format.xml  { render :xml => @trigger, :status => :created, :location => @trigger }
  #       else
  #         format.html { render :action => "new" }
  #         format.xml  { render :xml => @trigger.errors, :status => :unprocessable_entity }
  #       end
  #     end
  #   end

  def edit
  end

  def update
    respond_to do |format|
      if @trigger.update_attributes(params[:trigger])
        flash[:notice] = 'Trigger was successfully updated.'
        format.html { redirect_to(@trigger) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trigger.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @trigger.destroy

    respond_to do |format|
      format.html { redirect_to(@channel) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_trigger_channel
      @trigger = Trigger.find_by_id(params[:id])
      @channel = Channel.find_by_id(params[:channel_id])
    end
    
    def has_permission?
      redirect_to(login_url) unless logged_in?
      owns_channel(@channel)
    end
end

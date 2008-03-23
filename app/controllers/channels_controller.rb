class ChannelsController < ApplicationController
  before_filter :find_channel, :except => [:index, :new, :create]
  before_filter :has_permission?, :except => [:index, :show, :new, :create]
  
  def index
    @channels = Channel.find(:all)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @channels }
    end
  end

  def show

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @channel }
    end
  end

  def new
    redirect_to "/login" unless logged_in?
    @channel = Channel.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @channel }
    end
  end

  def create
    redirect_to "/login" unless logged_in?
    @channel = Channel.new(params[:channel])

    respond_to do |format|
      if @channel.save
        flash[:notice] = 'Channel was successfully created.'
        format.html { redirect_to(@channel) }
        format.xml  { render :xml => @channel, :status => :created, :location => @channel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        flash[:notice] = 'Channel was successfully updated.'
        format.html { redirect_to(@channel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @channel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to(channels_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_channel
      @channel = Channel.find_by_id(params[:id])
    end
    
    def has_permission?
      redirect_to "/login" unless logged_in?
      owns_channel(@channel)
    end
end

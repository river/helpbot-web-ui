class TriggersController < ApplicationController
  before_filter :find_trigger
  before_filter :has_permission?, :except => [:show]
   
  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @trigger }
    end
  end

  def update
   respond_to do |format|
      if @trigger.update_attributes(params[:trigger])
        flash[:notice] = 'Trigger was successfully updated.'
        format.html { render :action => "show" }
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
    def find_trigger
      @trigger = Trigger.find(params[:id])
    end
    
    def has_permission?
      redirect_to login_path unless logged_in?
      owns_trigger(@trigger)
    end
end

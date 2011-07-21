class GeneralController < ApplicationController
layout "page"
  def index
    if current_user.nil?
      render :layout => "page"
    else
      redirect_to :controller => "users", :action => "edit", :id => current_user.id
    end
  end
	
  def welcome
    @text = Alumni.export
  end 
 
  def contact
  end
  
  def despre
  end
  
  def ifc
  end
  
  def iss
  end
  
  def mentorat
  end
  
  def pv
  end
  
  def calendar
  end
  
end

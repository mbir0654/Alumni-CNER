class MessagesController < ApplicationController
before_filter :require_user
layout "page"
before_filter :load_user

  def index
    @total = @user.messages.count
    @messages = @user.messages.paginate :page => params[:page], :per_page => 10
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = "Mesajul a fost trimis"
      redirect_to "/"
    else
      render :action => :new
    end 
  end

  def new
    @message = Message.new 
  end
  
  def show
    @message = Message.find(params[:id])
    @message.update_attribute(:r,1)
  end
  
  def destroy
    Message.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
  def load_user
    redirect_to "/" unless current_user

    @user = User.find(params[:user_id]) if current_user.role == "admin"
    @user = current_user if current_user.role != "admin" && current_user.role != "intern"
  end
end

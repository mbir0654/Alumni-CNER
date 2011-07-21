class AccountInformationsController < ApplicationController
  before_filter :require_user
  layout 'page'
  before_filter :load_user
  def new
    @info=AccountInformation.new
  end
  
  def create
    @info=AccountInformation.new(params[:account_information])
    @info.user_id=@user.id
    if @info.save
      flash[:notice] = "Date salvate!"
      redirect_to :action => :show
      Notifier.deliver_welcome(@user)
    else
      render :new
    end    
  end

  def edit
    @info=@user.accountInformation
  end
  
  def update
    @info=@user.accountInformation
    if @info.update_attributes(params[:account_information])
      flash[:notice]="Date modificate"
      redirect_to :action => :show
    else
      flash[:notice]="Date nu au putut fi modificate"
      render :action => :edit
    end
  end

  def show 
    @info=@user.accountInformation
    if @info.nil?
      @info=AccountInformation.new
    end
  end

  private
    def load_user
    redirect_to "/" unless current_user
    @user = User.find(params[:user_id]) if current_user.role == "admin"
    @user = current_user if current_user.role != "admin" && current_user.role != "intern"
    end
end

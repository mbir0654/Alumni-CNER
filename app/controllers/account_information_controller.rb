class AccountInformationController < ApplicationController
  layout 'page'
  before_filter :load_user
  def new
    @info=AccountInformation.new
  end

  def edit
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
    params[:id]=params[:user_id] if params[:id].nil?
    @user = User.find(params[:id]) if current_user.role == "admin"
    @user = current_user if current_user.role != "admin" && current_user.role != "intern"
    end
end

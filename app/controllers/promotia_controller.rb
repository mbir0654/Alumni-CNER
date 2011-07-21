class PromotiaController < ApplicationController
  before_filter :require_user
  layout 'page'
  before_filter :load_user
  
  def show
    @info=AccountInformation.all(:conditions => ['promotia = ?',params[:id]]).paginate :page=> params[:page], :per_page=> 10
    @total=@info.count
    @promotia=params[:id]    
  end
  
  private
    def load_user
    redirect_to "/" unless current_user
    @user = User.find(params[:id]) if current_user.role == "admin"
    @user = current_user if current_user.role != "admin" && current_user.role != "intern"
  end
end

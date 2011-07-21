class UserSessionsController < ApplicationController
layout "page"
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Autentificare cu succes!"
      redirect_to "/users/#{current_user.id}/edit"
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Sesiune inchisa"
    redirect_to root_url
  end
end

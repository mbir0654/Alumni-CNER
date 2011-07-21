class UsersController < ApplicationController
layout "page"
before_filter :require_user, :except => [:new, :create]
before_filter :require_admin, :only => [:destroy]
before_filter :load_user, :except => [:new, :create]

  def index
    @users = User.all.paginate :page=>params[:page], :per_page=>10
    @total = User.all.count
  end
  
  def search
    @users = []
    @total = 0

    if params[:keyword] == nil || params[:keyword] == ""
      return
    end
    
    keywordSplit = params[:keyword].split
    keywordSplit.concat [""]
    search = AccountInformation.search
    
    puts "keyword split -> "
    puts keywordSplit
    
    if keywordSplit.count > 2
      search.nume_like_any_or_prenume_like_any = [keywordSplit[0], keywordSplit[1]]
    else
      search.nume_like_or_prenume_like = keywordSplit[0]
    end
               
    @accInfo = search.all
    @accInfo.each do |a|
      if !a.user.nil?
        @users.push a.user
      end        
    end
    @total = @users.count
    @users = @users.paginate :page=>params[:page], :per_page=>10
  end

  def promotia
    @info=AccountInformation.all(:conditions => ['promotia = ?',@user.accountInformation.promotia]).paginate :page=> params[:page], :per_page=> 10
    @total=@info.count
    @promotia=params[:id]    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if User.all.count == 0
      @user.role = "admin"
    else
      @user.role = "alumn"
    end
    if @user.save
      flash[:notice] = "Inregistrare completa!"
      redirect_to root_url
    else
      flash[:notice] = "A aparut o problema in timpul inregistrarii. Va rugam reincercati"
      render :action => "new"
    end
  end

  def destroy
    User.find(params[:id]).destroy
  end

  def edit
    if @user.accountInformation.nil?
      flash[:notice]="Trebuie sa setati datele personale"
      redirect_to new_user_accountInformation_path(@user)
    end
  end
  
  def update
    respond_to do |format|
      if @user.update_attributes params[:user] 
        flash[:notice] = 'Informatiile au fost salvate cu succes'
        if current_user.role == "admin" 
          format.html { redirect_to :controller => "admin", :action => "users" }
        else
          format.html { redirect_to :controller => "users", :action => "edit" }
        end
      else
        format.html { render :action => :edit }
      end
    end
  end
  
  private
    def load_user
    redirect_to "/" unless current_user
    @user = User.find(params[:id]) if current_user.role == "admin"
    @user = current_user if current_user.role != "admin"
    end

end

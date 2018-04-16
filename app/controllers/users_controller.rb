class UsersController < ApplicationController

 before_action :set_user, only: [:edit, :update, :show]
 before_action :require_same_user, only: [:edit, :update, :destroy]
 before_action :require_admin, only: [:destroy]

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end


  def new

    if !params.has_key?(:token)
      flash[:danger] = "You haven`t provide a token invitation"
      redirect_to root_path
    else
      @invitation = Invitation.find_by token: params[:token]

      if !@invitation
        flash[:danger] = "You haven`t provide a valid token invitation"
        redirect_to root_path
      end

    end

    @user = User.new
    @user.invitation = @invitation

  end

  def create

    if !params.has_key?(:token)
      flash[:danger] = "You haven`t provide a token invitation"
      redirect_to root_path
    else
      @invitation = Invitation.find_by token: params[:token]

      if !@invitation
        flash[:danger] = "You haven`t provide a valid token invitation"
        redirect_to root_path
      elsif  @invitation.email_recipient != params[:email]
        flash[:danger] = "You have filled in different email that invitation was sended"
        redirect_to root_path
      end
    end

    @user  = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to alpha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end


  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "User and all articles created by user have been deleted"
      redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
      @user = User.find(params[:id])
  end

  def require_same_user
     if  current_user != @user and !current_user.admin?
        flash[:danger] = "You can onley edit your own account"
        redirect_to root_path
    end
  end

  def require_admin
      if logged_in? and !current_user.admin?
          flash[:danger] = "Only admins can perform this acction"
          redirect_to root_path
      end
  end


end

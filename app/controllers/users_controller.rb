class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :require_same_user, only: %i[edit update destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @invitation = Invitation.find_by token: params[:token] if params.key?(:token)

    unless @invitation
      flash[:danger] = 'You haven`t provide a valid token invitation'
      redirect_to root_path
      return
    end

    @user = User.new
  end

  def create
    @invitation = Invitation.find_by token: params[:token] if params.key?(:token)

    unless @invitation
      flash[:danger] = 'You haven`t provide a valid token invitation'
      redirect_to root_path
      return
    end

    unless @invitation.email_recipient == user_params[:email]
      flash[:danger] = 'You have filled in different email that invitation was sended'
      redirect_to root_path
      return
    end

    @user = User.new(user_params)
    @user.invitation = @invitation
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to alpha blog #{@user.username}"
      redirect_to user_path(@user)
      return
    end

    render 'new'
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Your account was updated successfully'
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
    flash[:danger] = 'User and all articles created by user have been deleted'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def token_params
    params.require(:token)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if (current_user != @user) && !current_user.admin?
      flash[:danger] = 'You can onley edit your own account'
      redirect_to root_path
   end
  end

  def require_admin
<<<<<<< HEAD
    if logged_in? && !current_user.admin?
      flash[:danger] = 'Only admins can perform this acction'
      redirect_to root_path
    end
  end
=======
      if logged_in? and !current_user.admin?
          flash[:danger] = "Only admins can perform this acction"
          redirect_to root_path
      end
  end


>>>>>>> Add more feautes
end

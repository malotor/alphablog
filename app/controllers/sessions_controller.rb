class SessionsController < ApplicationController

  def new

  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:success] = "You have succesfully logged in"
          redirect_to user_path(user)
      else
         # Usamos now para que no se recarge ne la siguiente pagina
          flash.now[:danger] = "There is something wrong widht your login information"
          render 'new'
      end
  end

  def destroy
      session[:user_id] = nill
      flash[:success] = "You have succesfully logged out"
      redirect_to root_path
  end

end

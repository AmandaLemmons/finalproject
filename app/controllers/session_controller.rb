class SessionController < ApplicationController

  def new
      @user = User.new
  end


  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by username: username
    if (user) && (user.authenticate password)
      session[:user_id] = user.id
      redirect_to root_path
      # @current_user = user
    else
      flash.now[:danger] = "Try again. Invalid email/password combination"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end



end

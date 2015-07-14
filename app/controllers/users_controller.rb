class UsersController < ApplicationController
  require 'yelp'

  before_action :auth_user!, except: [:new, :create]

  def auth_user!
    @user_id = session[:user_id]
    @current_user = User.find_by id: @user_id

    if @current_user.nil?
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  before_action do
    @category = params[:category]
    @city = params[:city]
  end

  def show

    # when click on link, I want to save the hash["id"] from the link and display it on the show.html.erb

    @response_id = @response.business.find["id"]

    # @response_id = Yelp.client.search('id')





  end



  def create
    @user = User.new params.require(:user).permit(:username, :email, :password, :password_confirmation)
      if @user.save
      session[:user_id] = @user.id
    else
      render :new
    end
  end


  def destroy
    session.delete :user_id
    redirect_to login_path
  end



end

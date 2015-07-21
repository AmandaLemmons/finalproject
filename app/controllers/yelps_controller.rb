class YelpsController < ApplicationController
require 'yelp'

  rescue_from Yelp::Error::UnavailableForLocation do |exception|
    flash[:alert] = "The city you entered isn't vaild. Please try again. "
    redirect_to root_path
  end

  before_action do
    @category = params[:category] || "restaurants"
    @city = params[:city] || "Austin"
  end

  def auth_user!
    @user_id = session[:user_id]
    @current_user = User.find_by id: @user_id

    if @current_user.nil?
      redirect_to login_path
    end
  end


  def dashboard
  end
  

  def index

    parameters = { category: "restaurants" }
    if @category.present?
      parameters[:category_filter] = @category
    end

    if ["hotels", "restaurants"].include? parameters[:category]
      parameters[:term] = 'pet-friendly'
    end

    @response = Yelp.client.search(@city, parameters)
  end

end

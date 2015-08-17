class YelpsController < ApplicationController
require 'yelp'

  rescue_from Yelp::Error::UnavailableForLocation do |exception|
    flash[:alert] = "The city you entered isn't vaild. Please try again. "
    redirect_to root_path
  end

  before_action do

    if Rails.env.development?
      default_city = "Houston"
    else
      default_city = request.location.city
    end

    @category = params[:category] || "restaurants"
    @city = params[:city] || default_city
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
      parameters[:sort] = 1
      parameters[:limit] = 20
    end

    if ["hotels", "restaurants"].include? parameters[:category]
      parameters[:term] = 'pet-friendly'
    end

    if @category.nil? || @city.nil?
      flash.now[:danger] = "There aren't any matches for your search area."
      redirect_to index_path
    end

    @response = Yelp.client.search(@city, parameters)

  end

end

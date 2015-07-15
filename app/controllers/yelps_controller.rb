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


  def saved_location

    @saved_location = SavedLocations.new
    @saved_location.business_id = params[:business_id]
    @saved_location.user_id = @current_user.id
    @saved_location.save
    redirect_to show_path

  end



  def show

    # Need to make work. The first problem is with saved_locations. There isn't a saved location for the users

    @businesses = @current_user.saved_location.map do |sl|
      Yelp.client.business(sl.business_id)
    end



  # Allows you to show 1 business on the show screen. doesn't save them there. only shows once you click on the link

  #   business_id = params[:business_id]
  #   @business = Yelp.client.business(business_id)
  #   render :show, locals: {business: @business}
   end

end

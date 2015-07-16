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


  # def create
  # @current_user = User.find_by(id: session[:user_id])
#   @saved_location = SavedLocation.new
#   @saved_location.business_id = params[:business_id]
#   @saved_location.user_id = @current_user.id
#   @saved_location.save
#   redirect_to login_path
#
# end


  def show
    @saved_location = SavedLocation.new
    @saved_location.business_id = params[:business_id]
    @saved_location.user_id = @current_user.id
    @saved_location.save


  # shows all of them.
   @saved_locations = SavedLocation.all

   @saved_locations_user_ids = @saved_locations.select do |saved_locations_user_id|
     saved_locations_user_id.user_id == @current_user.id
   end
     @businesses = @saved_locations_user_ids.map do |sl|
      Yelp.client.business(sl.business_id)

   end


  #  @saved_locations.user_id == @current_user.id

  #  @businesses = @saved_locations.map do |sl|
  #   Yelp.client.business(sl.business_id)
  # #
  #  end



  #   @saved_locations = SavedLocation.all
  #   # @saved_locations = SavedLocation.where(user_id: saved_location_id)
  #
  #  @current_user_loaction = @saved_locations.map do |user_location|
  #     user_location.user_id == @current_user.id


    # @businesses = @current_user_loaction.map do |sl|
    #     Yelp.client.business(sl.business_id)
    #  end


    #
    # @businesses = @saved_locations.map do |sl|
    #    Yelp.client.business(sl.business_id)

  # @current_user_loaction =  @saved_locations.map do |location|
  #     location.user_id == @current_user.id
  #   end
  #
  #    @businesses = @current_user_loaction.map do |sl|
  #      Yelp.client.business(sl.business_id)

   end

    # Need to make work. The first problem is with saved_locations. There isn't a saved location for the users
    # saved_locations = @saved_location.all

    #  @businesses = @current_user.saved_locations.map do |sl|
    #    Yelp.client.business(sl.business_id)
    #  end



  # Allows you to show 1 business on the show screen. doesn't save them there. only shows once you click on the link

    # business_id = params[:business_id]
    # @business = Yelp.client.business(business_id)
    # render :show, locals: {business: @business}

    # @businesses = @current_user.saved_locations.map do |sl|
    #   Yelp.client.business(sl.business_id)
    # end
  #  end

end

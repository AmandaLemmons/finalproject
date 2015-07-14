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

  def index
    parameters = { category: "restaurants" }
    if @category.present?
      parameters[:category_filter] = @category
    end

    if ["hotels", "restaurants"].include? parameters[:category]
      parameters[:term] = 'pet-friendly'
    end

    @response = Yelp.client.search(@city, parameters)

    @response.businesses.take(10).each do |business|
      @business_id = business.id
      @business = Yelp.client.business(@business_id)
    end




  end

  def show

  end



end

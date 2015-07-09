class YelpsController < ApplicationController
require 'yelp'

  rescue_from Yelp::Error::UnavailableForLocation do |exception|
    flash[:alert] = "City was not found. Please try again. "
    redirect_to root_path
  end

  before_action do
    @category = params[:category]
    @city = params[:city] || "Houston"
  end

  def index
    parameters = { category_filter: "restaurants" }
    if @category.present?
      parameters[:category_filter] = @category
    end

    if ["hotels", "restaurants"].include? parameters[:category_filter]
      parameters[:term] = 'pet-friendly'
    end

    @response = Yelp.client.search(@city, parameters)

  end





# hotels and restaurants don't match up with yelp.com.




end

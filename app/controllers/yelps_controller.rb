class YelpsController < ApplicationController
require 'yelp'

  before_action do
    @category = params[:category]
    @city = params[:city] || "Houston"
  end

  def index

    # if hotel or restaurant, add "pet-friendly"

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

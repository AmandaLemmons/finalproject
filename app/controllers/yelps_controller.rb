class YelpsController < ApplicationController
require 'yelp'

  before_action do
    @category = params[:category]
    @city = params[:city]
  end

  def index

     if @category == ("hotels" || "restaurants") && @city.present?

      parameters = { category_filter: @category, term: 'pet-friendly'  }
      @response = Yelp.client.search(@city, parameters)

    else
      parameters = { category_filter: @category }
      @response = Yelp.client.search(@city, parameters)

    end
  end





# hotels and restaurants don't match up with yelp.com.




end

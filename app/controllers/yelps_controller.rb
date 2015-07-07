class YelpsController < ApplicationController
require 'yelp'

  before_action do
    @category = params[:category]
    @city = params[:city]
  end


  def index
    if @category.present? && @city.present?
      parameters = { category_filter: @category, term: 'pet-friendly'  }
      @response = Yelp.client.search(@city, parameters)
    end
  end

  def show
    parameters = { category_filter: @category, term: 'pet-friendly'  }
    @response = Yelp.client.search(@city, parameters)
  end




# hotels and restaurants don't match up with yelp.com.

  def hotels
    @title = "Hotels"
    parameters = { category_filter: category, term: 'pet-friendly'  }
    @response = Yelp.client.search(location, parameters)
  end

  def restaurants
    @title = "Restaurants"
    parameters = { category_filter: 'restaurants', term: 'pet-friendly'  }
    @response = Yelp.client.search('Houston', parameters)
  end
  #
  #
  # def dogparks
  #   @title = "Dog Parks"
  #   parameters = { category_filter: 'dog_parks', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  # def petstores
  #   @title = "Pet Stores"
  #   parameters = { category_filter: 'petstore', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  # def vets
  #   @title = "Vets"
  #   parameters = { category_filter: 'vet', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  # def groomers
  #   @title = "Groomers"
  #   parameters = { category_filter: 'groomer', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  # def pet_sitting
  #   @title = "Pet Sitters"
  #   parameters = { category_filter: 'pet_sitting', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  # def pet_training
  #   @title = "Pet Trainers"
  #   parameters = { category_filter: 'pet_training', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  # def dogwalkers
  #   @title = "Dog Walkers"
  #   parameters = { category_filter: 'dogwalkers', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  # def animalshelters
  #   @title = "Animal Shelters"
  #   parameters = { category_filter: 'animalshelters', limit: 10 }
  #   @response = Yelp.client.search('San Francisco', parameters)
  # end
  #
  #





end

class YelpsController < ApplicationController
require 'yelp'

# hotels and restaurants don't match up with yelp.com.

  def hotels
    @title = "Hotels"
    parameters = { category_filter: 'hotels', term: 'pet-friendly'  }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def restaurants
    @title = "Restaurants"
    parameters = { category_filter: 'restaurants', term: 'pet-friendly'  }
    @response = Yelp.client.search('San Francisco', parameters)
  end


  def dogparks
    @title = "Dog Parks"
    parameters = { category_filter: 'dog_parks', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def petstores
    @title = "Pet Stores"
    parameters = { category_filter: 'petstore', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def vets
    @title = "Vets"
    parameters = { category_filter: 'vet', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def groomers
    @title = "Groomers"
    parameters = { category_filter: 'groomer', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def pet_sitting
    @title = "Pet Sitters"
    parameters = { category_filter: 'pet_sitting', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def pet_training
    @title = "Pet Trainers"
    parameters = { category_filter: 'pet_training', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def dogwalkers
    @title = "Dog Walkers"
    parameters = { category_filter: 'dogwalkers', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end

  def animalshelters
    @title = "Animal Shelters"
    parameters = { category_filter: 'animalshelters', limit: 10 }
    @response = Yelp.client.search('San Francisco', parameters)
  end







end

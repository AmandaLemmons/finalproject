class SearchItem < ActiveRecord::Base
  # validates check_city.valid

  # def check_city
  #   parameters = { category_filter: "restaurants" }
  #   response = Yelp.client.search(@city, parameters)
  # end


  def self.yelp_categories
    [
      ["Animal Shelters", "animalshelters"],
      ["Dog Parks", "dog_parks"],
      ["Dog Walkers", "dogwalkers"],
      ["Groomers", "groomer"],
      ["Hotels", "hotels"],
      ["Pet Sitting", "pet_sitting"],
      ["Pet Stores", "petstore"],
      ["Pet Training", "pet_training"],
      ["Restaurants", "restaurants"],
      ["Vets", "vet"],
      ]
  end



end

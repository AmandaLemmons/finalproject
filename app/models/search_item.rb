class SearchItem < ActiveRecord::Base
  validates :category, presence: true
  validates :location, presence: true

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

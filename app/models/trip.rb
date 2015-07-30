class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :saved_locations
  
  validates :description, presence: true
  validates :name, presence: true


end

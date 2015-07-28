class SavedLocation < ActiveRecord::Base
  belongs_to :trip
  validates :business_id, presence: true
  
end

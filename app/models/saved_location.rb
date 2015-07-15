class SavedLocation < ActiveRecord::Base
  belongs_to :user
  validates :business_id, presence: true
  
end

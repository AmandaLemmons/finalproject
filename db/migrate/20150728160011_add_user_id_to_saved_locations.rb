class AddUserIdToSavedLocations < ActiveRecord::Migration
  def change
    add_column :saved_locations, :user_id, :integer
  end
end

class AddSavedLocationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :saved_locations, :string
  end
end

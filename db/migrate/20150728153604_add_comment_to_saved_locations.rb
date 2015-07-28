class AddCommentToSavedLocations < ActiveRecord::Migration
  def change
    add_column :saved_locations, :comment, :string
    add_column :saved_locations, :trip_id, :integer
    remove_column :saved_locations, :user_id, :integer
  end
end

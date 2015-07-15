class CreateSavedLocations < ActiveRecord::Migration
  def change
    create_table :saved_locations do |t|
      t.integer :user_id
      t.string :business_id

      t.timestamps null: false
    end
  end
end

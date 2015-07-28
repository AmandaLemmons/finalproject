class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :saved_locations
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

class CreateSearchItems < ActiveRecord::Migration
  def change
    create_table :search_items do |t|
      t.string :category
      t.string :location

      t.timestamps null: false
    end
  end
end

class CreateRestaurantFoodtypes < ActiveRecord::Migration
  def change
    create_table :restaurant_foodtypes do |t|
    
      t.integer :restaurant_id
      t.integer :foodtype_id
        
      t.timestamps null: false
    end
  end
end

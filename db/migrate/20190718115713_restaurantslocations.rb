class Restaurantslocations < ActiveRecord::Migration[5.2]
  create_table :restaurants_locations do |t|
    t.integer :restaurant_id
    t.integer :location_id

    t.timestamps
    
  end


end

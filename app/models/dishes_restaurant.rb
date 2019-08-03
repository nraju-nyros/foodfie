class DishesRestaurant < ApplicationRecord
	belongs_to :dish, :dependent => :destroy
	belongs_to :restaurant, :dependent => :destroy
end

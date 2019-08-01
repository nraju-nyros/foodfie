class LocationsRestaurant < ApplicationRecord
	belongs_to :restaurant 
	belongs_to :location
end

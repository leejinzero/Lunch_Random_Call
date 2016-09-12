class Restaurant < ActiveRecord::Base
    
	has_many :comments
	has_many :menus
	has_many :restaurant_foodtypes

    geocoded_by :address
    after_validation :geocode
end

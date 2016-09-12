class RestaurantFoodtype < ActiveRecord::Base
    belongs_to :foodtype
    belongs_to :restaurant
end

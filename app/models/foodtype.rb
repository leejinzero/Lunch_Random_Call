class Foodtype < ActiveRecord::Base
    has_many :restaurant_foodtypes
end

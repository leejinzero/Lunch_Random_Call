class LocationController < ApplicationController
  def daum_api

  end

  def save
    restaurant = Restaurant.new
    restaurant.address = params[:address]
    restaurant.latitude = params[:latitude]
    restaurant.longitude = params[:longitude]
    restaurant.name = params[:name]
    restaurant.phone_number = params[:phone_number]
    restaurant.average_score = 0
    if (params[:delivery] == "true")
      restaurant.delivery = true
    elsif (params[:delivery] == "false")
      restaurant.delivery = false
    end
    restaurant.save
    for i in 1..6
      if(params["food"+i.to_s]==nil)
      else
        restaurant_foodtypes = RestaurantFoodtype.new
        restaurant_foodtypes.restaurant_id = restaurant.id
        restaurant_foodtypes.foodtype_id = i
        restaurant_foodtypes.save
      end
    end
    # redirect_to "/location/daum_api"
    redirect_to "/home/index"
  end
end

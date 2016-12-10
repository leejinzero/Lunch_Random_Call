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
    restaurant.menu_a = params[:menu_a]
    restaurant.menu_b = params[:menu_b]
    restaurant.menu_c = params[:menu_c]
    restaurant.menu_d = params[:menu_d]
    restaurant.menu_e = params[:menu_e]
    restaurant.price_a = params[:price_a]
    restaurant.price_b= params[:price_b]
    restaurant.price_c= params[:price_c]
    restaurant.price_d= params[:price_d]
    restaurant.price_e= params[:price_e]
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

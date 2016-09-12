# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Foodtype.create(name: "한식/분식")
Foodtype.create(name: "치킨/찜닭")
Foodtype.create(name: "중식")
Foodtype.create(name: "피자/양식")
Foodtype.create(name: "돈까스/일식")

Restaurant.create( id: 1, name: "우리집", phone_number: "053", average_score: 4.3, delivery: false, address: "대구 달서구 감삼동 553", latitude: 35.8473808, longitude: 128.5328673)
Restaurant.create( id: 2, name: "너희집", phone_number: "05363333", average_score: 3.3, delivery: false, address: "대구 달서구 감삼동 553", latitude: 35.8473808, longitude: 128.5328673)
Restaurant.create( id: 3, name: "이웃집소녀떡볶이 쪽문점", phone_number: "01050094857", average_score: 2.3, delivery: true, address: "대구 북구 대현동 220-4", latitude: 35.8820988, longitude: 128.611918 )
Restaurant.create( id: 4, name: "봉구스 밥버거(쪽문점)", phone_number: "053554321", average_score: 1.3, delivery: true, address: "대구 동구 신암동 816-14", latitude: 35.8818244, longitude: 128.6125272 )
Restaurant.create( id: 5, name: "맘스터치 경대쪽문점", phone_number: "0539550044", average_score: 0.3, delivery: true, address: "대구 동구 신암동 189-10", latitude: 35.8774442, longitude: 128.6169012 )


RestaurantFoodtype.create(restaurant_id: 1, foodtype_id: 1)
RestaurantFoodtype.create(restaurant_id: 1, foodtype_id: 2)
RestaurantFoodtype.create(restaurant_id: 1, foodtype_id: 3)
RestaurantFoodtype.create(restaurant_id: 2, foodtype_id: 2)
RestaurantFoodtype.create(restaurant_id: 2, foodtype_id: 4)
RestaurantFoodtype.create(restaurant_id: 3, foodtype_id: 3)
RestaurantFoodtype.create(restaurant_id: 3, foodtype_id: 4)
RestaurantFoodtype.create(restaurant_id: 3, foodtype_id: 5)
RestaurantFoodtype.create(restaurant_id: 4, foodtype_id: 1)
RestaurantFoodtype.create(restaurant_id: 4, foodtype_id: 4)
RestaurantFoodtype.create(restaurant_id: 5, foodtype_id: 3)

class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      
      t.string :name, null: false  # 가게이름 
      t.string :phone_number, null: false # 전화번호
      t.float :average_score, null: false # 평균점수
      t.boolean :delivery, null: false  #배달가능여부
      t.string :address, null: false # 주소
      t.float :latitude, null: false # 위도      
      t.float :longitude, null: false # 경도
      t.string :menu_a, null: false  # 가게이름 
      t.string :price_a, null: false  # 가게이름 
      t.string :menu_b, null: false  # 가게이름 
      t.string :price_b, null: false  # 가게이름 
      t.string :menu_c, null: false  # 가게이름 
      t.string :price_c, null: false  # 가게이름
      t.string :menu_d, null: false  # 가게이름 
      t.string :price_d, null: false  # 가게이름 
      t.string :menu_e, null: false  # 가게이름 
      t.string :price_e, null: false  # 가게이름 
      
    #  t.boolean :bun_sik #분식
     # t.boolean :chicken # 치킨/찜닭
    #  t.boolean :westurn #피자/양식
     # t.boolean :han_sik #한식
    #  t.boolean :japanese #돈까스/일식
     # t.boolean :chinese #짱깨
      
      t.timestamps null: false
    end
  end
end

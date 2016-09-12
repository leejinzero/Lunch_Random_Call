class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      
      t.string :name #메뉴명
      t.string :price #가격
      t.integer :restaurant_id
      
      t.timestamps null: false
    end
  end
end

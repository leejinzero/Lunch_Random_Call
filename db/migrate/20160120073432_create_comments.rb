class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.text :comment #코멘트
      t.integer :score #점수
      t.integer :user_id
      t.integer :restaurant_id
      t.timestamps null: false
    end
  end
end

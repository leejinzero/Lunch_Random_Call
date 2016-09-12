class RestaurantController < ApplicationController
  def show
      @restaurant = Restaurant.find(params[:id])
      @comments = @restaurant.comments.page(params[:page]).per(10)
      
  end    
  
  def destroy
    
  end
  
  def new
    
      @overlap = 0
      Restaurant.find(params[:id]).comments.each do |x|
        if current_user.id == x.user_id
          @overlap = current_user.id    
        end 
      end
    
    if @overlap == 0
      comment = Comment.new
      comment.user_id = current_user.id
      comment.restaurant_id = params[:id]
      comment.score =  params[:rating]
      comment.comment = params[:msg]
      comment.save
      sum = 0.0
      restaurant = Restaurant.find(params[:id])
      restaurant.comments.each do |x|
        sum += x.score
      end
      
      restaurant.update_attribute(:average_score, sum/(restaurant.comments.size))
      redirect_to :back
    else
      flash[:notice] = "이미 등록하셨습니다"
      redirect_to :back
    end
  end    
end

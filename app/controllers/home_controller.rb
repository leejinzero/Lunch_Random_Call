class HomeController < ApplicationController
  def index
    @pick = params[:pick]
    @restaurants = Restaurant.all
    restaurants_array = Array.new
    
    condition = (Foodtype.arel_table[:name].eq(params[:han_sik])).or(Foodtype.arel_table[:name].eq(params[:chicken]))
    .or(Foodtype.arel_table[:name].eq(params[:chinese])).or(Foodtype.arel_table[:name].eq(params[:westurn]))
    .or(Foodtype.arel_table[:name].eq(params[:japanese]))
    
    if (params[:check]=="okay")
       Foodtype.where(condition).each do |f|
        f.restaurant_foodtypes.each do |x|
          restaurants_array.push(x.restaurant_id)
        end
      end
      @msg = "검색결과 입니다."
       @select_restaurant = Restaurant.where(:id => restaurants_array.uniq)
      
     else
       @msg = "모든 음식점 결과입니다."
      @select_restaurant = Restaurant.all
      
    end
    
    @random = Restaurant.all.sample()
    #@comments = @random.comments

  end
  def foo
    redirect_to :action => 'index' , han_sik: params[:han_sik],
                                     chicken: params[:chicken],
                                     chinese: params[:chinese],
                                     japanese: params[:japanese],
                                     westurn: params[:westurn],
                                     check: params[:check],
                                     pick: params[:pick] 
                                     
  end                               
  def support
  end
  def email_send
    from = params[:email]
    title = params[:title]
    content = params[:content]
    Mymailer.support(from, title, content).deliver_now
    redirect_to '/'
  end
  def delete_comment
    comment = Comment.find(params[:id])
    restaurant = Restaurant.find(comment.restaurant_id)
    if comment.user.id == current_user.id
      comment.delete
    end
    if (restaurant.comments.size > 0)
      sum=0.0
      restaurant.comments.each do |x|
        sum += x.score
      end
      restaurant.update_attribute(:average_score, (sum/(restaurant.comments.size)).round(1))
    else  
      restaurant.update_attribute(:average_score, 0.round(1))
    end
    redirect_to :back
  end
  
  def modify_comment
    @comment = Comment.find(params[:id])
  end
  
  def modify
    comment=Comment.find(params[:id])
    comment.update_attribute(:score, params[:rating])
    comment.update_attribute(:comment, params[:msg])
    restaurant = Restaurant.find(comment.restaurant_id)
    sum=0.0
    restaurant.comments.each do |x|
      sum += x.score
    end
    restaurant.update_attribute(:average_score, (sum/(restaurant.comments.size)).round(1))
    redirect_to "/restaurant/"+restaurant.id.to_s
  end
end
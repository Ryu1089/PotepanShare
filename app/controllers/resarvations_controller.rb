class ResarvationsController < ApplicationController
  def index
    @rooms = Room.all
    
 
  end
  
  def new
    @resarvation = Resarvation.new(resarvation_params)
    binding.pry
    
    if @resarvation.invalid?
      render "rooms/show"
    else
     @date_gap = @resarvation.date_gap.to_i
     @resarvation.total_price = @room.price * @resarvation.people * @date_gap
    end
    
    
  end
  
  def create
    @resarvation = current_user.resarvations.create(resarvation_params)
    redirect_to root_path notice:"予約が完了しました"
    
   
  end
   
  def update
  
    
  end
  
  
  private

 def resarvation_params
  params.require(:resarvation).permit(:start, :room_id, :end, :people).merge(user_id: current_user.id)

 end
  
  
  
 
end

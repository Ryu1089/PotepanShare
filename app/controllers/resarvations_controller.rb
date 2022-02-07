class ResarvationsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @user = User.find(current_user.id)
    @room = Room.all
    @resarvations = Resarvation.all
    
   

  
  end
  
  def show
    @resarvation = Resarvation.find(params[:id])
    @user = current_user.id
   
    
    
  end
  
  def new
    @resarvation = Resarvation.new(resarvation_params)
    @room = Room.find(params[:room_id])
    @resarvation.room_id = @room.id

    if @resarvation.invalid?
      flash[:notice] = "項目全て入力してください"
      redirect_to "/rooms/#{params[:room_id]}"
    else
      price = @room.price
      resarver = @resarvation.people
      days = (@resarvation.end.to_date - @resarvation.start.to_date).to_i
      @resarvation.total_price = (days * resarver * price)
     
    end
    
    
  end
  
  def create
    @user = current_user.id
    @resarvation = Resarvation.new(resarve_params)
    @room = Room.find(params[:resarvation][:room_id])
    
    if @resarvation.save
      flash[:notice] = "予約完了しました"
      redirect_to  @resarvation
    else
      
      redirect_to  resarvations_new_path
      flash[:notice] = "予約できませんでした"
    end
    
  end
  
  def destroy
  
  end
   
  def update
  
    
  end
  
  
  private

 def resarvation_params
  params.permit(:start, :room_id, :end, :people, :resarvation_id).merge(user_id: current_user.id)
 end
 
 def resarve_params
  params.require(:resarvation).permit(:start, :room_id, :end, :people, :total_price, :resarvation_id).merge(user_id: current_user.id)
 end
  
  
  
 
end

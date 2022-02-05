class ResarvationsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @user = User.find(current_user.id)
    @rooms = Room.all
    @resarvations =  @user.resarvations 
  
  end
  
  def show
    @resarvations = Resarvation.where(user_id: @user)
    @room = Room.find_by(params[:room_id])
    @user = current_user.id
    
    
  end
  
  def new
    @resarvation = Resarvation.new(resarvation_params)
    @room = Room.find(params[:room_id])
   
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
    @resarvation = Resarvation.new(resarve_params)
    @user = current_user.id
    @room = Room.find_by(params.require(:resarvation).permit(:room_id))
    binding.pry
    
    
    if @resarvation.save
      flash[:notice] = "予約完了しました"
      redirect_to  "/resarvations/:id"
    else
      
      redirect_to  "/resarvations/:id"
      flash[:notice] = "予約できませんでした"
    end
    
  end
  
  def destroy
    @resarvations = Resarvation.find(params[:id])
    @resarvations.destroy
    flash[:notice] = "予約履歴を削除しました"
    redirect_to :resarvations
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

class RoomsController < ApplicationController
  
  before_action :set_q, only: [:index, :search]
    
  def index
    @rooms = Room.all
   
  
    
   
    
  end
  
  def new
    @room = Room.new
    
  
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save(validate: false)
      redirect_to :rooms
      flash[:notice] = "ルームを登録しました"
    else
      render"new"
      
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: current_user.id)
    @resarvation = Resarvation.new
  
    
   
    
   
    
  end
  
  
  def update
  end
  
  def destroy
  end
  
  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    if @q_header
      @rooms = @q_header.result(distinct: true)
    end
   
  
  end
  
  private

  def set_q
    @q = Room.ransack(params[:q])
    
  end
  
  def room_params
      params.require(:room).permit(:name, :introduction, :price, :address,:image).merge(user_id: current_user.id)
  end
  

   
end

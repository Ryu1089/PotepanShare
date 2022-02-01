class RoomsController < ApplicationController
  
  before_action :set_q, only: [:index, :search]
    
  def index
    @rooms = Room.all
   
    
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:name,:introduction,:price,:address))
    if @room.save
      redirect_to :rooms
      flash[:notice] = "Room was successfully created."
    else
      render"new"
      
    end
  end
  
  def show
    @room = Room.find(params[:id])
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
end

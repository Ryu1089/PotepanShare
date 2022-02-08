class UsersController < ApplicationController
  
  def index
    @user = current_user
    
  
  end
  
  def show
    @user = current_user
  
    
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:username,:introduction,:image))
      flash[:notice]="変更しました"
      redirect_to :users
    else
      render"edit"
    end
  end
  
end

class UsersController < ApplicationController
  
  def index
    @users = User.all
  
  end
  
  def show
    @user = current_user
  
    
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:username,:introduction))
      flash[:notice]="変更しました"
      redirect_to @user
    else
      render"edit"
    end
  end
  
end

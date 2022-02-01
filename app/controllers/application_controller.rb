class ApplicationController < ActionController::Base
  before_action :set_q_for_room
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  
  def set_q_for_room
    @q_header = Room.ransack(params[:q])
  end
end

class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  
  def affter_sign_in_path_for(resource)
    user_path(@user.id)
  end  
  
  def after_sign_out_for(resource)
    about_path
  end  
    
  
  protected
  
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end  
end

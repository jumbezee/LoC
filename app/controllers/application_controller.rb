class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  

  private
  
  def rootlaw!
    if current_user.admin?
    else
      redirect_to root_path
    end
  end

  def authenticate_user!
      unless current_user
        if request.xhr?
          render json: {msg: "Вы не авторизованы"}, status: 403            
        else
          redirect_to root_path
        end
      end
  end
  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end

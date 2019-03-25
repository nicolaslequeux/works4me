class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :phone_number, :email, :password, :password_confirmation, :remember_me, :avatar, :is_available, :bio])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :phone_number, :email, :password, :password_confirmation, :remember_me, :avatar, :is_available, :bio])
  end

  def redirect_or_fallback(fallback_url)
    if params[:redirect_to]
      redirect_to params[:redirect_to]
    else
      redirect_to fallback_url
    end
  end
end

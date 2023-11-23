class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user) # ログインした直後は、ユーザーの詳細ページに遷移
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :encrypted_password, :name, :admin])
  end
end

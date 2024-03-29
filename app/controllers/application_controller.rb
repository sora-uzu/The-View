class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger
  def after_sign_in_path_for(_resource)
    current_user
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def after_sign_up_path_for(_resource)
    current_user
  end

  protected

  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image])
    # アカウント編集の時にnameとimageのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image])
  end
end

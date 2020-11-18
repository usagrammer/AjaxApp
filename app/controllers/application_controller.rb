class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure＿permitted＿parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    '/' # サインアップ後のリダイレクト先URL
  end

  def configure＿permitted＿parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end

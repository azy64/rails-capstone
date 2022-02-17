class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(_resource)
    groups_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password)
    end
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end
end

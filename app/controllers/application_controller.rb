class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :sanitize_devise_params, if: :devise_controller?

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

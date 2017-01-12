class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_last_travels

  before_action :sanitize_devise_params, if: :devise_controller?

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private
    def get_last_travels
      today = Date.today
      current_month = today.month
      @travels_per_month = 0.upto(5).map { |n|
        Travel.by_months_ago(n)
      }
      @displayed_months = 6.downto(1).map { |n|
        DateTime::MONTHNAMES.drop(1)[(current_month - n)] % 12
      }
    end
end

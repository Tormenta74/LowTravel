class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_months

  before_filter :sanitize_devise_params, if: :devise_controller?

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def get_months
    today = Date.today
    current_month = today.month
    @travels_per_month = []
    @displayed_months = 6.downto(1).map { |n|
      DateTime::MONTHNAMES.drop(1)[(current_month - n)] % 12
      if(current_month == n)
        @travels_per_month << Travel.by_year_and_month(today.year - 1, 12)
      else
        @travels_per_month << Travel.by_year_and_month(today.year, current_month - n)
      end

    }

  end
end

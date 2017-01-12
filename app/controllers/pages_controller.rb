class PagesController < ApplicationController
  def home
    @last_travel = Travel.first
    @slides_providers = Travel.published.most_recent.first(4)
  end

  def about
  end
end

class PagesController < ApplicationController
  def home
    @last_travel = Travel.published.last
  end

  def about
  end
end

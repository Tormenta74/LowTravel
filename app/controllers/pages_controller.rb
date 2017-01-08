class PagesController < ApplicationController
  def home
    @last_travel = Travel.published.last
    @slides_providers = Travel.published.last(4).reverse
  end

  def about
  end
end

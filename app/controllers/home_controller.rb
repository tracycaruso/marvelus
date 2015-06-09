class HomeController < ApplicationController

  def index
    @superheros = Superhero.hero_view(9)
  end
end

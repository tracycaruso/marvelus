class HomeController < ApplicationController

  def index
    @superheros = Superhero.take(9)
  end
end

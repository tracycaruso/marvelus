class SuperherosController < ApplicationController

  def index
    @superheros = Superhero.order("RANDOM()")
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

end

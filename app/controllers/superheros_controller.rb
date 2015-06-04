class SuperherosController < ApplicationController

  def index
    @superheros = Superhero.all.sample(9)
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

end

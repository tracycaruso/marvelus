class SuperherosController < ApplicationController

  def index
    @superheros = Superhero.all
    # @superheros = Superhero.paginate(page: params[:page], per_page: 6)
    @females    = Superhero.female
    @males      = Superhero.male
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

end

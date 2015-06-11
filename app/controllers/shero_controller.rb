class SheroController < ApplicationController

  def index
    @females = Superhero.female
  end
end

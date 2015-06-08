class UsersController < ApplicationController

  def show
    superhero_matcher = SuperheroMatcher.new(current_user)
    @superhero = superhero_matcher.match
  end

end

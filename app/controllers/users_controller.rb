class UsersController < ApplicationController

  def show
    if current_user
      superhero_matcher = SuperheroMatcher.new(current_user)
      @superhero = superhero_matcher.match
    else
      redirect_to "/auth/twitter"
    end
  end

end

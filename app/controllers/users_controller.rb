class UsersController < ApplicationController

  def show
    if current_user
      superhero_matcher = SuperheroMatcher.new(current_user)
      @superhero = superhero_matcher.match
      @closest_matches = superhero_matcher.closest_matches
    else
      redirect_to "/auth/twitter"
    end
  end

  def tweet
    TwitterService.tweet(current_user, superhero_match)
    redirect_to superhero_path(superhero_match)
  end

end

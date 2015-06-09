class UsersController < ApplicationController

  def show
  end

  def tweet
    TwitterService.tweet(current_user, superhero_match)
    redirect_to superhero_path(superhero_match)
  end

end

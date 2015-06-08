class SuperheroMatcher
  attr_reader :score

  def initialize(user)
    @score = user.sentiment_score
  end

  def match
    Superhero.all.min_by {|hero| (hero.sentiment_score -  score).abs }
  end

end


class SuperheroMatcher
  attr_reader :score

  def initialize(user)
    @score = user.sentiment_score
  end

  def match
    # Superhero.all.min_by {|hero| (hero.sentiment_score -  score).abs }
    Superhero.order("abs(superheros.sentiment_score - #{score})").first
  end

  def closest_matches
    Superhero.order("abs(superheros.sentiment_score - #{score})")[-3..-1]
  end



end


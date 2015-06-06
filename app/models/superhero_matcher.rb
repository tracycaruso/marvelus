class SuperheroMatcher

  def self.closest_score(score)
    Superhero.scores.min_by { |s| (s - score).abs }
  end

  def self.match(score)
    Superhero.where(sentiment_score: closest_score(score)).sample
  end

end

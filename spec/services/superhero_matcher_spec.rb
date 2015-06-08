require 'rails_helper'

RSpec.describe SuperheroMatcher do 
  describe "#match" do 

    it "can match a user with a Superhero with a similar score" do
      user = User.new(sentiment_score: 22)
      superheros = [  Superhero.create(sentiment_score: 50), 
                      Superhero.create(sentiment_score: 20),
                      Superhero.create(sentiment_score: -8)
                    ]

      hero_matcher = SuperheroMatcher.new(user)

      expect(hero_matcher.match).to eq(superheros.second)
    end

    context "When multiple Superheroes have same score" do
      it "matches the user to the first Superhero" do
        user = User.new(sentiment_score: 22)
        superheros = [  Superhero.create(sentiment_score: 50), 
                        Superhero.create(name: "Happy", sentiment_score: 20),
                        Superhero.create(name: "Wendy", sentiment_score: 20),
                        Superhero.create(sentiment_score: -8)
                      ]
        hero_matcher = SuperheroMatcher.new(user)

        expect(hero_matcher.match).to eq(superheros.second)
      end
    end
  end
end
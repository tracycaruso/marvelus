class User < ActiveRecord::Base

  def self.sentiment_vivekn_service
    @sentiment_vivekn_service ||= SentimentViveknService.new
  end

  def self.twitter_service
    @twitter_service ||= TwitterService.new
  end

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.email = auth.info.email
    user.nickname = auth.info.nickname
    user.image_url = auth.info.image
    user.token = auth.credentials.token
    user.save
    user
  end

  def tweet_text
    User.twitter_service.collect_tweets(self.nickname)
  end

  def calculate_sentiment_vivekn
    User.sentiment_vivekn_service.sentiment(tweet_text)
  end

  def calculate_sentiment_alchemy
    AlchemyAPI.search(:sentiment_analysis, text: tweet_text)
  end

  def aggregate_sentiment_score
    ((calculate_sentiment_vivekn[:confidence].to_f / 100.0) + (calculate_sentiment_alchemy["score"].to_f * 100.0)).to_i
  end

end

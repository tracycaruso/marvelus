class TwitterService
  attr_reader :twitter

  def initialize
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key =   ENV['TWITTER_CONSUMER_KEY'] #'opXfTHFYAmTjOZrbsJfU1SLH8'
      config.consumer_secret =   ENV['TWITTER_CONSUMER_SECRET'] #'NJMjgWp26HCNRelzMmBT3v0ho3O11MRDlFd9GT99vVx1hHBXzx'
      config.access_token =   ENV['TWITTER_YOUR_ACCESS_TOKEN'] #'3232966190-s81bwnpNKpcUueN9GnSRpp9rj6nkqZE3gfgbf1v'
      config.access_token_secret =  ENV['TWITTER_YOUR_ACCESS_SECRET'] #'PfIn4kdWIODFYBVH9EtPsv1CLNVnAGom8lcWplegd6oH8'
    end
  end

  def collect_tweets(user)
    twitter.user_timeline(user).take(10).collect do |tweet|
      "#{tweet.text}"
    end
  end

end

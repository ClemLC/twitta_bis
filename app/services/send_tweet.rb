class SendTweet

  def initialize(text)
    @text = text
  end

  def perform
    log_in_to_twitter
    send_a_tweet(@text)
  end

  def log_in_to_twitter
    Dotenv.load
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = ENV['TWITTER_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end
  end

  def send_a_tweet(tweet)
    @client.update(tweet)
  end
end

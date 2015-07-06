require 'yelp'

  @client = Yelp.client.configure do |config|
  config.consumer_key = ENV.fetch("YELP_CONSUMER_KEY")
  config.consumer_secret = ENV.fetch("YELP_CONSUMER_SECRET")
  config.token = ENV.fetch("YELP_TOKEN")
  config.token_secret = ENV.fetch("YELP_TOKEN_SECRET")
end

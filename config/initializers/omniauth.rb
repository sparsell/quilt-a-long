Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    # provider :google, ENV['CONSUMER_KEY'] , ENV['CONSUMER_SECRET']

  end
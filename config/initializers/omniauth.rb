Rails.application.config.middleware.use OmniAuth::Builder do
   
    provider :github, Rails.application.credentials.github[:key], Rails.application.credentials.github[:secret]
    provider :google_oauth2, Rails.application.credentials.google[:google_client_id], Rails.application.credentials.google[:google_client_secret]

    # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true
   
  end
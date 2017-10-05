# require 'rspotify/oauth'
# OmniAuth.config.logger = Rails.logger
# OmniAuth.config.full_host = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "76244476330-7k84hcgsoeuhvmvfrus68om3hv9ar56v.apps.googleusercontent.com", "KWr-O9nL6BI4a9BJsl_jXiAO", {}
  provider :spotify, "3317d8a5e75749a992e0d7e51a82bcc1", "fa52a8907e1940c8916ce1bdf3aade9c", scope: 'playlist-read-private user-read-private user-read-email'
end

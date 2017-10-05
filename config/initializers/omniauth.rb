# require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "76244476330-7k84hcgsoeuhvmvfrus68om3hv9ar56v.apps.googleusercontent.com", "KWr-O9nL6BI4a9BJsl_jXiAO", {}
  provider :spotify, "3317d8a5e75749a992e0d7e51a82bcc1", "fa52a8907e1940c8916ce1bdf3aade9c", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end

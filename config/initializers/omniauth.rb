
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "76244476330-7k84hcgsoeuhvmvfrus68om3hv9ar56v.apps.googleusercontent.com", "KWr-O9nL6BI4a9BJsl_jXiAO", {}
end
# require 'net/http'
# require 'uri'
require 'rspotify'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def spotify
    
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    hash = spotify_user.to_hash #Hash conrain all details like token and refreshtoken.
    @user = User.from_spotify(hash) #Persited in db    
    debugger
    # spotify_user = RSpotify::User.new(hash) #Recover whenever we like to recover.
    if @user
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Spotify'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end



    # artists = RSpotify::Artist.search('Arctic Monkeys')    
    # uri = URI.parse("https://api.spotify.com/v1/me/playlists")
    # request = Net::HTTP::Get.new(uri)
    # request["Accept"] = "application/json"
    # request["Authorization"] = "Bearer #{current_user.token}"
    # req_options = { use_ssl: uri.scheme == "https" }
    # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    #   http.request(request)
    # end
    # json = JSON.parse(response.body)
  end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

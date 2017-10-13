class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :spotify]

  #Mount uploader
  # mount_uploader :avatar, AvatarUploader
  
  #Association
  has_many :user_albums
  has_many :albums, through: :user_albums

  has_many :user_tracks
  has_many :tracks, through: :user_tracks

  

  #Uploader
  # mount_uploader :image, AvatarUploader

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(email: data['email'], password: Devise.friendly_token[0,20])
    end
    user
  end

  def self.from_spotify(hash)
    
    credentials = hash["credentials"]
    user = User.where(email: hash["email"]).first
    unless user
      user = User.create(token: credentials.token,
                         refresh_token: credentials.refresh_token,
                         expires_at: credentials.expires_at,
                         email: hash["email"],
                         name: hash["display_name"],
                         # country: hash["country"],
                         url: hash["external_urls"].spotify,
                         password: Devise.friendly_token[0,20])
    end

    if user.token == credentials.token
      user
    else 
      user.update(token: credentials.token,
                 refresh_token: credentials.refresh_token,
                 expires_at: credentials.expires_at,
                 email: hash["email"])
    end
    user
  end
end

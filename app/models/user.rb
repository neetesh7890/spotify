class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :spotify]

  #Mount uploader
  # mount_uploader :avatar, AvatarUploader
  
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
    debugger
    unless user
      user = User.create(token: credentials.token,
                         refresh_token: credentials.refresh_token,
                         expires_at: credentials.expires_at,
                         email: hash["email"],
                         name: hash["display_name"],
                         name: hash["country"],
                         url: hash["external_urls"].spotify,
                         password: Devise.friendly_token[0,20])
    end
    user
  end
end

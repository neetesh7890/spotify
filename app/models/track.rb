class Track < ApplicationRecord
  has_many :user_tracks
  has_many :users, through: :user_tracks

  has_many :album_tracks
  has_many :albums, through: :album_tracks

  has_many :related_tracks, as: :trackable
  has_many :artists, through: :related_tracks

end

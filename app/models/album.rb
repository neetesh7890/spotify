class Album < ApplicationRecord
  has_many :user_albums
  has_many :users, through: :user_albums

  has_many :album_tracks 
  has_many :tracks, through: :album_tracks

  has_many :related_tracks, as: :trackable
  has_many :artists, through: :related_tracks

  has_many :related_tracks, as: :trackable
  has_many :artists, through: :related_tracks

end

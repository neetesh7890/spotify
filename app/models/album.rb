class Album < ApplicationRecord
  belongs_to :album_item, polymorphic: true
  has_many :songs, as: :song_item
end

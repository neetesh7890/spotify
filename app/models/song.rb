class Song < ApplicationRecord
  belongs_to :song_item, polymorphic: true
end

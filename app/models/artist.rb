class Artist < ApplicationRecord
  has_many :albums, as: :album_item
  belongs_to :user
end

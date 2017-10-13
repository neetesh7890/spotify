class RelatedTrack < ApplicationRecord
  belongs_to :trackable, polymorphic: true  
  belongs_to :artist
end

class CreateRelatedTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :related_tracks do |t|
      t.references :trackable, polymorphic: true, index: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end

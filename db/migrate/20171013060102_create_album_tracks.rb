class CreateAlbumTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :album_tracks do |t|
      t.references :album, index: true
      t.references :track, index: true

      t.timestamps
    end
  end
end

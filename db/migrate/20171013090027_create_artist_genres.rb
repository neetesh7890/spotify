class CreateArtistGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_genres do |t|
      t.references :artist, index: true
      t.references :genre, index: true

      t.timestamps
    end
  end
end

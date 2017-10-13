class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :spotify_name
      t.string :isrc_code
      t.integer :popularity
      t.string :platform_id
      t.string :spotify_id
      t.string :spotify_url
      t.string :preview_url
      t.string :available_market
      t.string :artist_name
      t.integer :duration
      t.string :image_url
      

      t.timestamps
    end
  end
end

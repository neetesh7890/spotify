class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :singer_name
      t.string :image
      t.references :song_item, polymorphic: true, index: true
      t.string :get_song
      t.string :playlist_name

      t.timestamps
    end
  end
end

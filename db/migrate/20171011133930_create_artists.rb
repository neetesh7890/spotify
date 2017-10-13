class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :spotify_name
      t.integer :popularity
      t.integer :followers
      t.string :image_url
      
      t.timestamps
    end
  end
end

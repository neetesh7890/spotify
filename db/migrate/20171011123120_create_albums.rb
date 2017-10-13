class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :spotify_id
      t.string :spotify_url
      t.string :release_date 
      t.string :image_url
      t.string :large_image_url
      t.string :upc_code
      
      t.timestamps
    end
  end
end

class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :singer_name
      t.string :get_album
      t.string :image
      t.references :album_item, polymorphic: true, index: true

      t.timestamps
    end
  end
end

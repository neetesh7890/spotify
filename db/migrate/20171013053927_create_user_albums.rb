class CreateUserAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :user_albums do |t|
      t.references :user, index: true
      t.references :album, index: true

      t.timestamps
    end
  end
end

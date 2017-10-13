class CreateUserTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tracks do |t|
      t.references :user, index: true
      t.references :track, index: true

      t.timestamps
    end
  end
end

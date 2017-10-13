class AddTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :token, :text
    add_column :users, :expires_at, :integer
    add_column :users, :country, :string
    add_column :users, :spotify_url, :string
    add_column :users, :spotify_id, :string
    add_column :users, :image_url, :string
  end
end

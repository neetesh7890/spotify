class AddTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token, :text
    add_column :users, :refresh_token, :text
    add_column :users, :expires_at, :integer
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :url, :string
  end
end

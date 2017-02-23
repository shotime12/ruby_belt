class AddPlayToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :play, :string
  end
end

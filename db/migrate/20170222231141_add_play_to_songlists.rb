class AddPlayToSonglists < ActiveRecord::Migration[5.0]
  def change
    add_column :songlists, :play, :integer
  end
end

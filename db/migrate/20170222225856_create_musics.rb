class CreateMusics < ActiveRecord::Migration[5.0]
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :title
      t.integer :play
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSonglists < ActiveRecord::Migration[5.0]
  def change
    create_table :songlists do |t|
      t.references :user, foreign_key: true
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end

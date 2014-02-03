class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist, index: true
      t.references :album, index: true

      t.timestamps
    end
  end
end

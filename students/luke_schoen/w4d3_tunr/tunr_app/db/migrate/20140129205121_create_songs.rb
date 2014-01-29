class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.text :description
      t.string :length
      t.string :integer
      t.references :album, index: true
      t.references :artist, index: true

      t.timestamps
    end
  end
end

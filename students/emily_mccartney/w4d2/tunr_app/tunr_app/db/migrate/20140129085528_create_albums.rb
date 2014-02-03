class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :year
      t.references :artist, index: true

      t.timestamps
    end
  end
end

class PlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs do |t|
      t.references :playlist, index: true
      t.references :song, index: true

      t.timestamps
    end
  end
end

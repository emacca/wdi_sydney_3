Artist.destroy_all
Album.destroy_all
Song.destroy_all

Artist.create(
  :name => 'Jason Derulo',
  :gender => 'Male',
  :bio => 'This is a Bio'
)

Album.create(
  :title => 'Tattoos',
  :description => 'I am an album description',
  :year => '2013',
  :artist_id => Artist.first
)

Song.create(
  :title => 'Trumpets',
  :artist_id => Artist.first,
  :album_id => Album.first
)

Playlist.create(
  :name => 'fitness playlist'
)
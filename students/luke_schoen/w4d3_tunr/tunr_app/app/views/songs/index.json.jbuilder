json.array!(@songs) do |song|
  json.extract! song, :id, :name, :description, :length, :integer
  json.url song_url(song, format: :json)
end

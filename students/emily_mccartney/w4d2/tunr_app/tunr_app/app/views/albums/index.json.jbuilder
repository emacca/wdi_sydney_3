json.array!(@albums) do |album|
  json.extract! album, :id, :title, :description, :year, :artist_id
  json.url album_url(album, format: :json)
end

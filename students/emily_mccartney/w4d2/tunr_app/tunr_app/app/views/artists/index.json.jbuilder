json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :gender, :bio
  json.url artist_url(artist, format: :json)
end

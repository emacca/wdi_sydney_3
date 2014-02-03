json.array!(@destinations) do |destination|
  json.extract! destination, :id, :name, :location, :description
  json.url destination_url(destination, format: :json)
end

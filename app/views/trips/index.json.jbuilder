json.array!(@trips) do |trip|
  json.extract! trip, :name, :description
  json.url trip_url(trip, format: :json)
end
json.array!(@foundations) do |foundation|
  json.extract! foundation, :id, :name
  json.url foundation_url(foundation, format: :json)
end

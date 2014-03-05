json.array!(@recommendations) do |recommendation|
  json.extract! recommendation, :id, :name, :link
  json.url recommendation_url(recommendation, format: :json)
end

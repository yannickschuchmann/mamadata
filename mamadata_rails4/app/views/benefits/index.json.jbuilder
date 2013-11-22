json.array!(@benefits) do |benefit|
  json.extract! benefit, :name, :description
  json.url benefit_url(benefit, format: :json)
end

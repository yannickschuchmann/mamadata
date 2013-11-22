json.array!(@benefits) do |benefit|
  json.extract! benefit, :name, :descriptioin
  json.url benefit_url(benefit, format: :json)
end

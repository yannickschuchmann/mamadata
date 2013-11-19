json.array!(@beneficiaries) do |beneficiary|
  json.extract! beneficiary, :name, :fathers_name, :gender, :date_of_birth, :place_of_birth, :native_place, :house_name, :house_number, :street_name, :city, :pin_code
  json.url beneficiary_url(beneficiary, format: :json)
end
